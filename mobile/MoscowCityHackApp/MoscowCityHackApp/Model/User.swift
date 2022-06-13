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
    User(registrationDate: "август 2021", name: "Дима Дин", interests: ["Svelte", "Python"], friends: [], achievements: [])
], achievements: [.init(title: "Еда в детдом", totalCount: 10, completedCount: 7, animation: "food", description: "Приносить еду в детдом 10 месяцев подряд"),
                  .init(title: "Любитель собак", totalCount: 1, completedCount: 1, animation: "love-dog", description: "Взять собаку из приюта")])

