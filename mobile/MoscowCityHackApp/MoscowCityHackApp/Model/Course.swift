import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var courses = [
    Course(title: "Помочь бесплатно Skillbox", subtitle: "Надо проверить задания наших учеников :) Нужно знать Python и основы ML.", caption: "2000 заданий - 500 часов", color: Color(hex: "7850F0"), image: Image("Topic 1")),
    Course(title: "Загнать собак в приют", subtitle: "Собираем всех на помощь! Нам нужно поймать всех собак в Москве", caption: "3000 собак - 200 часов", color: Color(hex: "6792FF"), image: Image("Topic 2")),
    Course(title: "Build a SwiftUI app for iOS 15", subtitle: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more", caption: "21 sections - 4 hours", color: Color(hex: "005FE7"), image: Image("Topic 1"))
]
