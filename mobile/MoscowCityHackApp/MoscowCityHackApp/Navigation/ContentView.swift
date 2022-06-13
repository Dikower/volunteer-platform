import SwiftUI
import RiveRuntime

struct ContentView: View {
    @State var show = false
    @State var showStoriesView = false
    @ObservedObject var viewModel: ViewModel
    var button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            Color(hex: "17203A").ignoresSafeArea()
            
            HomeView(showStoriesView: $showStoriesView)
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 80)
                }
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 104)
                }
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .scaleEffect(show ? 0.92 : 1)
                .ignoresSafeArea()
            
            TabBar()
                .offset(y: -24)
                .background(
                    LinearGradient(colors: [Color("Background").opacity(0), Color("Background")], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .allowsHitTesting(false)
                )
                .ignoresSafeArea()
                .offset(y: show ? 200 : 0)
            
            Image(systemName: "person")
                .frame(width: 36, height: 36)
                .background(.white)
                .mask(Circle())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .padding()
                .offset(y: 4)
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
            
            if show {
                Group {
                    if UserDataService.isLoggedIn {
                        ProfileView(show: $show, viewModel: viewModel)
                    }
                    else {
                        OnboardingView(show: $show, viewModel: viewModel)
                    }
                }
                .background(.white)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                .ignoresSafeArea(.all, edges: .top)
                .offset(y: show ? -10 : 0)
                .zIndex(1)
                .transition(.move(edge: .top))
            }
            
            if showStoriesView {
                StoriesView(imageNames: ["nature", "children", "animals"], showStoriesView: $showStoriesView)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
            
        }
    }
}

extension UIViewController {
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = style == .lightContent ? UIColor.black : .white
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
}
