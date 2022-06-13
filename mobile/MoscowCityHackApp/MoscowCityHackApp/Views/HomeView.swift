import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @State var isSearchBarEditing: Bool = false
    @Binding var showStoriesView: Bool
    private let cardColors: [Color] = [.red, .yellow, .blue, .clear, .green]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Благодел")
                .font(.system(size: 36, weight: .black, design: .rounded))
                .padding(.leading, 20)
                .padding(.vertical, 10)

            SearchBar(text: $searchText, isEditing: $isSearchBarEditing)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            if !isSearchBarEditing {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<courses.count) { id in
                            VCard(course: courses[id], cardColor: cardColors[id % cardColors.count])
                        }
                    }
                    .padding(20)
                }
                
                VStack(alignment: .leading) {
                    Text("Истории")
                        .customFont(.title3)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(["nature", "animals", "children"], id: \.self) {
                                Image($0)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .mask(Circle())
                                    .onTapGesture {
                                        withAnimation {
                                            showStoriesView = true
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding(20)
            }
            
            if isSearchBarEditing {
                FilteringView()
                    .padding(.vertical, 10)
            }
            
            VStack {
                Text("Задания")
                    .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVStack(spacing: 20) {
                    ForEach(activities.filter({ activity in
                        if searchText.isEmpty {
                            return true
                        }
                        
                        return activity.title.contains(searchText)
                    })) { section in
                        NavigationLink {
                            ActivityDetailView(model: section)
                        } label: {
                            ActivityCard(model: section)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(20)
        }
    }
}
