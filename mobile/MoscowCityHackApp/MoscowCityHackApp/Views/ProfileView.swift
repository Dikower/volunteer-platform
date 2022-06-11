import SwiftUI
import RiveRuntime

struct ProfileView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ViewModel
    
    let button = RiveViewModel(fileName: "button", autoPlay: false)
    
    var body: some View {
        ZStack {
            content
            
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
            Text("Профиль")
                .font(.custom("Poppins Bold", size: 50))
                .frame(width: 260, alignment: .leading)
            
            HStack {
                Image("Avatar 2")
                    .resizable()
                    .mask(Circle())
                    .frame(width: 77, height: 77)
                
                Text("Дмитрий Шерлоков")
                    .customFont(.title)
            }
            
            Text("Друзья")
                .customFont(.title3)
                .opacity(0.7)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array([1, 3, 4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                        Image("Avatar \(number)")
                            .resizable()
                            .mask(Circle())
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Достижения")
                .customFont(.title3)
                .opacity(0.7)
            
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
