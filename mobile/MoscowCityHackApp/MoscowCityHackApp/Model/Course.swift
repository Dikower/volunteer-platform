import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

var courses = [
    Course(title: "Научное волонтерство: быстрый старт", subtitle: "Как помочь, если знаешь Python?"),
    Course(title: "Загнать собак в приют", subtitle: "Собираем всех на помощь! Нам нужно поймать всех собак в Москве"),
    Course(title: "Build a SwiftUI app for iOS 15", subtitle: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more")
]
