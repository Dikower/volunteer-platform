import Foundation

final class UserDataService {
    
    private enum UserDataKeys: String {
        case isLoggedIn
    }
    
    static var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDataKeys.isLoggedIn.rawValue)
        }
        set {
            guard isLoggedIn != newValue else {
                return
            }
            UserDefaults.standard.set(newValue, forKey: UserDataKeys.isLoggedIn.rawValue)
        }
    }
    
}
