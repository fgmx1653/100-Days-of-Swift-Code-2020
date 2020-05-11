import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CardView()
                .tabItem {
                    Image(systemName: "rectangle.fill.on.rectangle.angled.fill")
                    Text("Flash Cards")
            }
            .tag(1)
            
            ListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Sight Words")
            }
            .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.init(rawValue: "iPhone 11 Pro Max"))
            
            ContentView()
        }
    }
}

//MARK: - New .swift file.
struct CardView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Spacer()
                Text("Tab Content 1")
                    .font(.title)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width - 64,
                           height: UIScreen.main.bounds.width - 64)
                    .background(Color.white)
                    .cornerRadius(39)
                
                Spacer()
                Button(action: {
                    //
                }) {
                    Image(systemName: "speaker.3.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}

//MARK: - New .swift file.
struct ListView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Tab Content 2")
            }
            .navigationBarTitle("Sight Words List")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//MARK: - New .swift file.
struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Feedback").font(.title).bold()) {
                Text("Rate this app")
                Text("Send feedback")
            }
            
            Section(header: Text("About this app").font(.title).bold()) {
                Text("This app was developed to help with my kids as they practiced learning their site words.")
            }
        }
    }
}
