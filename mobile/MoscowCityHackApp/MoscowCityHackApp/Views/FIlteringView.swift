import SwiftUI

struct FilteringView: View {
    @State var showHot: Bool = false
    @State var selectedCategories: [String] = []
    var categories: [String] = ["Стажировка", "Забота о природе", "Помощь детям"]
    @State var selectedSkills: [String] = []
    var skills: [String] = ["Рисование", "Преподавание", "Веб-технологии"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $showHot) {
                Text("Горячие предложения")
                    .customFont(.footnote2)
                    .opacity(0.7)
            }
            .frame(maxWidth: 200)

            Text("Категории")
                .customFont(.footnote2)
                .opacity(0.7)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .customFont(.footnote)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(.systemGray3))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(selectedCategories.contains(category) ? Color.orange : Color.clear, lineWidth: 3)
                            )
                            .onTapGesture {
                                if selectedCategories.contains(category) {
                                    selectedCategories.removeAll { selected in
                                        return category == selected
                                    }
                                }
                                else {
                                    selectedCategories.append(category)
                                }
                            }
                    }
                }
            }
            
            Text("Скиллы")
                .customFont(.footnote2)
                .opacity(0.7)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(skills, id: \.self) { skill in
                        Text(skill)
                            .customFont(.footnote)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(.systemGray3))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(selectedSkills.contains(skill) ? Color.orange : Color.clear, lineWidth: 3)
                            )
                            .onTapGesture {
                                if selectedSkills.contains(skill) {
                                    selectedSkills.removeAll { selected in
                                        return skill == selected
                                    }
                                }
                                else {
                                    selectedSkills.append(skill)
                                }
                            }
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }

}
