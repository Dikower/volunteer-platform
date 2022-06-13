import SwiftUI

struct PickInterestsView: View {
    
    struct Interest: Hashable {
        let imageName: String
        let text: String
    }
    
    private let interests = [Interest(imageName: "nature", text: "Природа"),
                             Interest(imageName: "animals", text: "Животные"),
                             Interest(imageName: "children", text: "Дети")]
        
    
    private var gridItemLayout = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 15) {
                ForEach(interests, id: \.self) { interest in
                    ZStack {
                        Image(interest.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .clipped()
                            .cornerRadius(15)
                        
                        Color.black
                            .opacity(0.3)
                            .frame(width: 110, height: 110)
                            .cornerRadius(15)
                        
                        Text(interest.text)
                            .foregroundColor(.white)
                            .customFont(.footnote2)
                            .offset(x: -10, y: 35)
                    }
                }
            }
        }
        .padding()
    }
    
}

struct PickInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        PickInterestsView()
    }
}
