import SwiftUI

final class ViewModel: ObservableObject {
    
    func logIn() {
        UserDataService.isLoggedIn = true
        objectWillChange.send()
    }
    
    func deleteAccount() {
        UserDataService.isLoggedIn = false
        objectWillChange.send()
    }
    
}
