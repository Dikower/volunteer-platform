import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

var courses = [
    Course(title: "Научное волонтерство: быстрый старт", subtitle: "Как помочь, если знаешь Python?"),
    Course(title: "Студент? Становить волонтером!", subtitle: "Превилегии для студентов, участвующих в волонтерских программах."),
    Course(title: "Выбор собаки из приюта", subtitle: "На что стоит обратить внимание, когда берешь собаку из приюта."),

]
