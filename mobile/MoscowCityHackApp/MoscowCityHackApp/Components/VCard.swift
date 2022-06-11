import SwiftUI

struct VCard: View {
    var course: Course
    var cardColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.title)
                .customFont(.title2)
                .frame(maxWidth: 170, alignment: .leading)
                .layoutPriority(1)
            Text(course.subtitle)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            HStack {
                ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                    Image("Avatar \(number)")
                        .resizable()
                        .mask(Circle())
                        .frame(width: 44, height: 44)
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 280)
        .background(
            Image("recomend_background")
                .resizable()
                .scaledToFill()
                .overlay(cardColor.opacity(0.5))
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: cardColor.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: cardColor.opacity(0.3), radius: 2, x: 0, y: 1)
    }
}
