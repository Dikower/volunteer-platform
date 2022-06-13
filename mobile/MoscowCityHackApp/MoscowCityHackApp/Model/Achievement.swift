import SwiftUI

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let totalCount: Int
    let completedCount: Int
    let animation: String
    let description: String
}
