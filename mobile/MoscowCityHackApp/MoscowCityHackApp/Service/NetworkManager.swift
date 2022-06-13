import Foundation

final class NetworkManager {
    static let baseUrl = URL(string: "https://a4b3-81-200-30-66.eu.ngrok.io/")!

    struct User: Codable {
        let username: String
        let password: String
        let profile_type: String
    }
    
}

