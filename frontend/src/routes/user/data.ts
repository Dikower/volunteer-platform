export const data = {
  first_name: "Анастасия",
  last_name: "Гисина",
  friends: "5",
  subscriptions: "12",
  img: "/avatars/nastya.jpg",
  date_registration: "2022-06-14",
  active_month: "2",
  complete_tasks: "7",
  achievements: [
    {
      name: "Мастер",
      description: "12 активных месяцев без перерыва",
      progress: "10",
      total: "12",
      img: "/achievements/master.png"
    },
    {
      name: "Царь зверей",
      description: "500 заданий от благотворительных фондов помощи животным",
      progress: "100",
      total: "500",
      img: "/achievements/king.png"
    }
  ],
  graph: [
    { month: "Jan", count: 10, max: 15 },
    { month: "Feb", count: 15, max: 15 },
    { month: "Mar", count: 13, max: 15 },
    { month: "Apr", count: 14, max: 15 },
    { month: "May", count: 5, max: 15 },
    { month: "Jun", count: 6, max: 15 },
    { month: "Jul", count: 12, max: 15 },
    { month: "Aug", count: 14, max: 15 },
    { month: "Sep", count: 6, max: 15 },
    { month: "Oct", count: 15, max: 15 },
    { month: "Now", count: 0, max: 15 },
    { month: "Dec", count: 0, max: 15 }
  ],
  interests: ["Дизайн", "Бег", "Животные"]
};

export const dataLayout = {
  img: "/companies/ozon.png",
  name: "OZON.ru",
  desc: "Технологии, маркетплейс",
  top: 1,
  mark: 5.,
  articles: [],
  info: {
    creationDate: "15 октября 1998",
    location: "Россия",
    site: { short: "ozon.ru", full: "https://ozon.ru" },
    staff: "5000-1000 человек",
    regDate: "9 августа 2008",
    responsible: "Гисина Анастасия"
  },
  participation: {
    volunteers: 12_924,
    business: 30,
    tasks: 1000,
    retention: 70
  },

  // TODO calculate
  content: {
    blogAmount: 4,
    eventsAmount: 10
  }
};