import SwiftUI

@main
struct MoscowCityHackAppApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(viewModel: ViewModel())
                    .navigationBarHidden(true)
            }
        }
    }
    
}
