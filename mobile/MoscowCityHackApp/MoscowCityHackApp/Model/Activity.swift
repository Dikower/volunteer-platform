import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let type: String
    let isHot: Bool
    let lastThreeMembersIcons: [String]
    let activityImage: String
    let lowerBorderOfMembersAmount: Int
}

var activities = [
    Activity(title: "Стажировка БФ Кораблик", location: "Москва", type: "Стажировка", isHot: true, lastThreeMembersIcons: ["avatar_dima", "avatar_chel", "avatar_chel2"], activityImage: "https://korablik-fond.ru/wp-content/uploads/2022/05/nhtybyu-790x488.jpeg", lowerBorderOfMembersAmount: 30)
]
