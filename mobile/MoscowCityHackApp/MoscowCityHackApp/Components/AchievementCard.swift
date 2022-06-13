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
                
                Text(model.description)
                    .customFont(.footnote)
                    .opacity(0.7)
                HStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 160, height: 15)
                            .foregroundColor(Color(.systemGray4))

                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: CGFloat(160 * (Float(model.completedCount) / Float(model.totalCount))), height: 15)
                            .foregroundColor(.yellow)
                    }
                    
                    Text("\(model.completedCount)/\(model.totalCount)")
                }

            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .strokeBorder(Color.gray, lineWidth: 1)
        )
    }
    
}

