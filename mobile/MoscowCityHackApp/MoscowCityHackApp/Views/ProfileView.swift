import SwiftUI
import RiveRuntime

struct ProfileView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ViewModel
    let user: User = mockUser
    let button = RiveViewModel(fileName: "button", autoPlay: false)
    private let gridItemLayout = [GridItem(.flexible()), GridItem(), GridItem()]

    var body: some View {
        ZStack {
            ScrollView {
                content
            }
            
            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .background(.black)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .offset(y: 80)
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.system(size: 20, weight: .black, design: .rounded))

                    Text("Регистрация:" + user.registrationDate)
                    HStack {
                        Text("\(user.friends.count) друг")
                        Text("5 подписок")
                    }
                }
                
                Image("Avatar 2")
                    .resizable()
                    .mask(Circle())
                    .frame(width: 77, height: 77)
            }
            
            Text("Интересы")
                .customFont(.title3)

            LazyVGrid(columns: gridItemLayout, spacing: 15) {
                ForEach(user.interests, id: \.self) { interest in
                    Text(interest)
                        .frame(width: 100, height: 37, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 4, style: .continuous).fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .strokeBorder(Color.gray, lineWidth: 1)
                        )
                }
            }

            
            Group {
                Text("Статистика")
                    .customFont(.title3)
                
                HStack {
                    VStack {
                        Text("500")
                            .customFont(.title)
                        Text("выполненных заданий")
                            .customFont(.footnote)
                    }
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 4, style: .continuous).fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )

                    VStack {
                        Text("10")
                            .customFont(.title)
                        Text("активных месяцев")
                            .customFont(.footnote)
                    }
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 4, style: .continuous).fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
                }
            }

            
            BarChart(legend: "Месяц", barColor: .blue, data: chartDataSet)
                .frame(height: 240)
            
            Group {
                Text("Достижения")
                    .customFont(.title3)
                    .opacity(0.7)
                
                ForEach(user.achievements, id: \.id) {
                    AchievementCard(model: $0)
                }
            }
            
            Spacer()
            
            Text("Поделиться в соц. сетях")
                .customFont(.title3)
                .opacity(0.7)
            
            Text("Вы можете удалить аккаунт.")
                .customFont(.footnote)
                .opacity(0.7)
            
            Button {
                withAnimation {
                    viewModel.deleteAccount()
                }
            } label: {
                Text("Удалить аккаунт")
            }

        }
        .padding(40)
        .padding(.top, 40)
        .background(
            RiveViewModel(fileName: "shapes").view()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .blur(radius: 30)
                .blendMode(.hardLight)
        )
        .background(
            Image("Spline")
                .blur(radius: 50)
                .offset(x: 200, y: 100)
        )
    }
    
}

//struct ProfileView_pres: PreviewProvider {
//    @State var isShow = true
//    static var previews: some View {
//        ProfileView(show: $isShow, viewModel: ViewModel(), user: mockUser)
//    }
//}
