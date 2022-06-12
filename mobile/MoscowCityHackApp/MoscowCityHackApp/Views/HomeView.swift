import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @Binding var showStoriesView: Bool
    private let cardColors: [Color] = [.red, .yellow, .blue, .clear, .green]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<courses.count) { id in
                        VCard(course: courses[id], cardColor: cardColors[id % cardColors.count])
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            
            VStack(alignment: .leading) {
                Text("Истории")
                    .customFont(.title3)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(["nature", "animals", "children"], id: \.self) {
                            Image($0)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .mask(Circle())
                                .onTapGesture {
                                    withAnimation {
                                        showStoriesView = true
                                    }
                                }
                        }
                    }
                }
            }
            .padding(20)

            VStack {
                Text("Задания")
                    .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 20) {
                    ForEach(activities) { section in
                        ActivityCard(model: section)
                    }
                }
            }
            .padding(20)
        }
    }
}
