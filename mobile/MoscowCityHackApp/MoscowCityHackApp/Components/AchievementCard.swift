import SwiftUI

struct AchievementCard: View {
    var model: Achievement
    
    var body: some View {
        HStack {
            LottieView(name: model.animation, loopMode: .loop)
                .frame(width: 70, height: 80)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.system(size: 18, weight: .black, design: .rounded))
                
                Text("12 активных месяцев без перерыва")
                    .customFont(.footnote)
                    .opacity(0.7)
                HStack {
                    ProgressView(value: Float(model.completedCount), total: Float(model.totalCount))
                        .frame(width: 160, height: 30)

//                    ZStack(alignment: .leading) {
//                        RoundedRectangle(cornerRadius: 20)
//                            .frame(width: 160, height: 15)
//                            .foregroundColor(.white)
//
//                        RoundedRectangle(cornerRadius: 20)
//                            .frame(width: 120, height: 15)
//                            .foregroundColor(.yellow)
//                    }
                    
                    Text("\(model.completedCount)/\(model.totalCount)")
                }

            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .strokeBorder(Color.gray, lineWidth: 1)
        )
    }
    
}
