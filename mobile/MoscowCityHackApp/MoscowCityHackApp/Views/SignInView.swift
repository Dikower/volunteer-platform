import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @State var isRegistration = false
    @Binding var show: Bool
    @ObservedObject var viewModel: ViewModel
    
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    
    func logIn() {
        isLoading = true
        
        if !email.isEmpty {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                confetti.triggerInput("Trigger explosion")
                withAnimation {
                    isLoading = false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    show.toggle()
                    viewModel.logIn()
                }
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text(isRegistration ? "Регистрация" : "Авторизация")
                .customFont(.largeTitle)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField(image: Image("Icon Email"))
            }
            
            VStack(alignment: .leading) {
                Text("Пароль")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField(image: Image("Icon Lock"))
            }
            
            Button {
                logIn()
            } label: {
                HStack {
                    Image(systemName: "arrow.right")
                    Text(isRegistration ? "Зарегистрироваться" : "Войти")
                        .customFont(.headline)
                }
                .largeButton()
            }
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("ИЛИ").customFont(.subheadline2).foregroundColor(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.1)
            }
            Text(isRegistration ? "Войти" : "Зарегистрироваться")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 30)
                .onTapGesture {
                    isRegistration.toggle()
                }

        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(
            ZStack {
                if isLoading {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
        .padding()
    }
}
