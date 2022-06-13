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
    let tasks: [String]
}

var activities = [
    Activity(title: "Стажировка БФ Кораблик", location: "Москва", type: "Стажировка", isHot: true, lastThreeMembersIcons: ["avatar_dima", "avatar_chel", "avatar_chel2"], activityImage: "https://korablik-fond.ru/wp-content/uploads/2022/05/nhtybyu-790x488.jpeg", lowerBorderOfMembersAmount: 30,
             tasks: ["Участие в разработке стратегии привлечения средств от компаний.", "Мониторинг рынка и поиск потенциальных партнеров, в т.ч. «холодный» поиск, формирование отношений с нуля, привлечение, формирование базы"]),
    Activity(title: "Субботник в Парке культуры", location: "Москва", type: "Субботник", isHot: false, lastThreeMembersIcons: ["Avatar 1", "Avatar 2", "Avatar 6"], activityImage: "https://astv.ru/content/AfishaImage/65/9e/659ef466-23fb-42be-8e3f-b46509f7e31d_1.jpg", lowerBorderOfMembersAmount: 100, tasks: ["уборка территории", "покраска бордюров"]),
    
    Activity(title: "Всероссийское движение “МЕД”", location: "Москва", type: "Медицина", isHot: true, lastThreeMembersIcons: ["Avatar 4", "Avatar 5", "avatar_chel"], activityImage: "https://www.mos.ru/upload/newsfeed/newsfeed/1(2)(4158).jpg", lowerBorderOfMembersAmount: 11, tasks: ["Помощь младшему и среднему медицинскому персоналу в палатах, перевязочных и процедурных кабинетах", "Содействие врачу в сборе жалоб и анамнеза", "Помощь в административно-организационной работе, оформлении документации", "Помощь в медицинском и общем уходе за пациентами", "Сопровождение больных на диагностические и лечебные процедуры", "Участие в поддержании санитарно-гигиенических норм"])

]
