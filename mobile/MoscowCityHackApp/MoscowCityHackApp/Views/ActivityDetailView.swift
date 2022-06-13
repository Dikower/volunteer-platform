import SwiftUI

struct ActivityDetailView: View {
    let model: Activity
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 20) {
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
                .frame(height: 180)
                .cornerRadius(6)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(model.title)
                            if model.isHot {
                                Image("hot")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 21)
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(0..<model.lastThreeMembersIcons.count) {
                                Image(model.lastThreeMembersIcons[$0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                    .mask(Circle())
                                    .offset(x: CGFloat($0 * -20))
                            }
                            
                            VStack {
                                Text("+\(model.lowerBorderOfMembersAmount) человек")
                                    .offset(x: -50)
                                    .font(.system(size: 12))
                                    .padding(.top, 8)
                                
                                Text("уже помогают этой организации")
                                    .offset(x: -45)
                                    .font(.system(size: 8))
                                    
                                Spacer()
                            }
                            .frame(maxWidth: 100)
                        }
                    }
                    
                    VStack(alignment: .leading) {
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
                    }
                }
                
                Text("Задачи")
                    .customFont(.body)
                    .opacity(0.7)
                
                Text(model.tasks)
                    .customFont(.footnote)
                    .opacity(0.7)
                
                Text("Требования")
                    .customFont(.body)
                    .opacity(0.7)
                HStack {
                    Spacer()
                    Button {
                        print("participate")
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(Color(hex: "EF476F"))
                            .frame(width: 220, height: 32)
                            .overlay(
                                Text("Присоединиться")
                                    .foregroundColor(.white)
                            )
                    }
                    Spacer()
                }
                
                Spacer()

            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActivityDetailView_pres: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(model: activities[0])
    }
}
