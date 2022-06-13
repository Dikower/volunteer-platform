import SwiftUI

final class ViewModel: ObservableObject {
    
//    static func createUser(user: User) async {
//        
//        guard let encoded = try? JSONEncoder().encode(user) else {
//            print("Failed to encode order")
//            return
//        }
//        
//        let userUrl = baseUrl.appendingPathComponent("users")
//        var request = URLRequest(url: userUrl)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        do {
//            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
//            // handle the result
//        } catch {
//            print("Checkout failed.")
//        }
//        
//    }
    
    func logIn() {
        UserDataService.isLoggedIn = true
        objectWillChange.send()
    }
    
    func deleteAccount() {
        UserDataService.isLoggedIn = false
        objectWillChange.send()
    }
    
}
