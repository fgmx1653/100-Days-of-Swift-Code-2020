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
            
            Text("Tab Content 3")
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
            ZStack {
                Image("poster")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 600)
                
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
            
            VStack {
                HeaderView(label: "Previews")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 5) { _ in
                            Circle()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 32)
            .padding(.vertical)
            
            // MARK: - New row
            VStack {
                HeaderView(label: "Watch It Again")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 5) { _ in
                            Rectangle()
                                .aspectRatio(2/3, contentMode: .fit)
                                .frame(height: 140)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 32)
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

struct HeaderView: View {
    let label: String
    
    var body: some View {
        HStack {
            Text(label)
                .bold()
                .padding(.trailing)
            Spacer()
        }
    }
}
