import SwiftUI

struct User {
    let id = UUID()
    let registrationDate: String
    let name: String
    let interests: [String]
    let friends: [User]
    let achievements: [Achievement]
}

var mockUser = User(registrationDate: "июнь 2022", name: "Анастасия Гисина", interests: ["Дизайн", "Бег", "Tilda", "Животные", "Маркетинг", "Спорт"], friends: [
    User(registrationDate: "август 2021", name: "Дима Дин", interests: ["Svelte", "Python"], friends: [], achievements: [.init(title: "Помог собакам", totalCount: 15, completedCount: 10, animation: "blender")])
], achievements: [.init(title: "Еда в детдом", totalCount: 10, completedCount: 7, animation: "blender"),.init(title: "Еда в детдом", totalCount: 10, completedCount: 7, animation: "blender")])
