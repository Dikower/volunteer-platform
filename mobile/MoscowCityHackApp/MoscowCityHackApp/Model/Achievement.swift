import SwiftUI

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let totalCount: Int
    let completedCount: Int
    let animation: String
}

var achievements = [
  Achievement(title: "Царь зверей", totalCount: 10, completedCount: 5, animation: "")
]
