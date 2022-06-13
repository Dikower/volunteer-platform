import SwiftUI

struct BarChartCell: View {
    
    var value: Double
    var barColor: Color
    var amount: Int
                             
    var body: some View {
        VStack {
            Text("\(amount)")
            RoundedRectangle(cornerRadius: 5)
                .fill(barColor)
                .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
        }
    }
}
