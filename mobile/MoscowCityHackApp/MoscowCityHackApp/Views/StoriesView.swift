import SwiftUI
import Combine

class StoryTimer: ObservableObject {
    @Published var progress: Double
    @Binding var showStroiesView: Bool
    private var interval: TimeInterval
    private var max: Int
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    
    init(items: Int, interval: TimeInterval, showStroiesView: Binding<Bool>) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
        self._showStroiesView = showStroiesView
    }
    
    func start() {
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max {
                withAnimation {
                    self.showStroiesView = false
                }
                newProgress = 0
                self.cancellable = nil
            }
            self.progress = newProgress
        })
    }
    
    func advance(by number: Int) {
        var newProgress = Int(self.progress) + number
        if newProgress >= max || newProgress < 0 {
            withAnimation {
                self.showStroiesView = false
            }
            newProgress = 0
            self.cancellable = nil
        }
        self.progress = Double(newProgress)
    }
}

struct StoriesView: View {
    var imageNames: [String]
    @Binding var showStoriesView: Bool
    @ObservedObject var storyTimer: StoryTimer
    
    init(imageNames: [String], showStoriesView: Binding<Bool>) {
        self.imageNames = imageNames
        self.storyTimer = StoryTimer(items: imageNames.count, interval: 3.0, showStroiesView: showStoriesView)
        self._showStoriesView = showStoriesView
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices) { x in
                        LoadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                }.padding()
                
                HStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.storyTimer.advance(by: -1)
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.storyTimer.advance(by: 1)
                    }
                }
            }
            .onAppear { storyTimer.start() }
        }
    }
}

struct LoadingRectangle: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
    
}
