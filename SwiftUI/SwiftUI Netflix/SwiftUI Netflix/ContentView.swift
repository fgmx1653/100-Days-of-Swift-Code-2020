import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            .tag(0)
            
            Text("Tab Content 2")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
            .tag(1)
            
            ComingSoonView()
                .tabItem {
                    Image(systemName: "rectangle.on.rectangle.angled")
                    Text("Coming Soon")
            }
            .tag(2)
            
            Text("Tab Content 4")
                .tabItem {
                    Image(systemName: "arrow.down.to.line")
                    Text("Downloads")
            }
            .tag(3)
            
            Text("Tab Content 5")
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("More")
            }
            .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView {
            HomeViewHeader()
            PreviewsRowView(label: "Previews")
            PostersRowView(label: "Watch It Again")
            PostersRowView(label: "Trending Now")
            VideoRowView(label: "Available Now: WWDC19")
            PostersRowView(label: "Popular on Netflix")
            PostersRowView(label: "Continue Watching for Caleb")
                .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Poster Buttons
struct TopPosterButtonsView: View {
    let buttons = ["TV Shows", "Movies", "My List"]
    
    var body: some View {
        HStack {
            ForEach(buttons, id: \.self) { button in
                Button(action: {
                    //
                }) {
                    Text(button)
                        .font(.caption)
                        .bold()
                }
                .padding()
            }
        }
    }
}

struct BottomPosterButtonsView: View {
    let buttons = [
        BottomPosterButton(image: "plus", label: "My List"),
        BottomPosterButton(image: "play.fill", label: "Play"),
        BottomPosterButton(image: "info.circle", label: "Info")
    ]
    
    var body: some View {
        HStack {
            ForEach(buttons, id: \.self) { button in
                Button(action: {
                    //
                }) {
                    if button.label == "Play" {
                        HStack {
                            Image(systemName: button.image)
                            Text(button.label)
                        }
                        .frame(width: 150, height: 34)
                        .foregroundColor(.black)
                        .background(Color.white)
                    .cornerRadius(8)
                        .padding()
                    } else {
                        VStack {
                            Image(systemName: button.image)
                            Text(button.label)
                                .font(.caption)
                                .bold()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct BottomPosterButton: Hashable {
    let image: String
    let label: String
}

struct HomeViewHeader: View {
    var body: some View {
        ZStack {
            Image("poster")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 600)
                .frame(width: UIScreen.main.bounds.width)
            
            VStack {
                TopPosterButtonsView()
                    .padding(.top, 44)
                
                Spacer()
                Text("Rousing • Exciting • Superhero • Action • Family")
                    .font(.caption)
                BottomPosterButtonsView()
            }
            .foregroundColor(.white)
        }
    }
}

struct RowsHeaderView: View {
    let label: String
    
    var body: some View {
        Text(label)
            .bold()
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PreviewsRowView: View {
    let label: String
    
    var body: some View {
        VStack {
            RowsHeaderView(label: label)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0 ..< 5) { _ in
                        Circle()
                            .frame(width: 100, height: 100)
                            .padding(.leading)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

struct PostersRowView: View {
    let label: String
    
    var body: some View {
        VStack {
            RowsHeaderView(label: label)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0 ..< 5) { _ in
                        Rectangle()
                            .aspectRatio(2/3, contentMode: .fit)
                            .frame(height: 140)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct VideoRowView: View {
    let label: String
    let buttons = [
        BottomPosterButton(image: "play.fill", label: "Play"),
        BottomPosterButton(image: "plus", label: "My List")
    ]
    
    var body: some View {
        VStack {
            RowsHeaderView(label: label)
                .padding(.top)
            
            VStack {
                Rectangle()
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width - 32)
                
                HStack {
                    ForEach(buttons, id: \.self) { button in
                        Button(action: {
                            //
                        }) {
                            HStack {
                                Image(systemName: button.image)
                                Text(button.label)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 2.5, height: 34)
                        .background(Color(.secondarySystemFill))
                        .cornerRadius(8)
                        .foregroundColor(Color(.label))
                        .padding()
                    }
                }
            }
        }
    }
}


// MARK: - Coming Soon Tab
struct ComingSoonView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: NotificationsView()) {
                    Image(systemName: "bell")
                    Text("Notifications")
                        .bold()
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
                .foregroundColor(Color(.label))
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            ForEach(0 ..< 5) { _ in
                HStack(alignment: .top) {
                    ZStack {
                        Rectangle()
                            .aspectRatio(16/9, contentMode: .fit)
                            .foregroundColor(Color(.systemGray4))
                            .offset(x: 16, y: 10)
                        
                        Rectangle()
                            .aspectRatio(16/9, contentMode: .fit)
                            .foregroundColor(Color(.systemGray2))
                            .offset(x: 8, y: 6)
                        
                        Image(uiImage: #imageLiteral(resourceName: "poster"))
                            .resizable()
                            .aspectRatio(16/9, contentMode: .fit)
                    }
                    .frame(width: 100)
                    .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text("Top 10 today!")
                            .bold()
                        Text("Watch them all!!")
                            .font(.caption)
                        Text("June 22")
                            .font(.caption)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarTitle("Notifications", displayMode: .inline)
    }
}
