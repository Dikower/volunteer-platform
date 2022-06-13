import SwiftUI

struct ActivityCard: View {
    var model: Activity = activities[0]
    
    var body: some View {
        HStack(spacing: 13) {
            AsyncImage(url: URL(string: model.activityImage), transaction: Transaction(animation: .spring())) { phase in
                switch phase {
                case .empty:
                    Color.purple.opacity(0.1)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
             
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .scaledToFit()
             
                @unknown default:
                    Image(systemName: "exclamationmark.icloud")
                }
                    
            }
            .frame(width: 140)
            .cornerRadius(20)
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 5) {
                    Text(model.title)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if model.isHot {
                        Image("hot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 21, height: 21)
                    }
                }

                
                HStack(spacing: 11) {
                    Image("location_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text(model.location)
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "8291B1"))
                }
                
                HStack(spacing: 11) {
                    Image("tag-outline")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 15)
                    
                    Text(model.type)
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "8291B1"))
                }
                                
                HStack {
                    Spacer()
                    HStack {
                        ForEach(0..<model.lastThreeMembersIcons.count) {
                            Image(model.lastThreeMembersIcons[$0])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 28)
                                .mask(Circle())
                                .offset(x: CGFloat($0 * -25))
                        }
                    }
                    .frame(maxWidth: 70)
                    
                    VStack {
                        Text("+\(model.lowerBorderOfMembersAmount) человек")
                            .offset(x: -25)
                            .font(.system(size: 12))
                            .padding(.top, 8)
                        
                        Text("уже помогают этой организации")
                            .offset(x: -18)
                            .font(.system(size: 8))
                            
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .padding(.top, 5)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 175)
        .background(
            Color("Background")
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
        )
    }
    
}

struct ActivityCard_pres: PreviewProvider {
    static var previews: some View {
        ActivityCard()
    }
}
