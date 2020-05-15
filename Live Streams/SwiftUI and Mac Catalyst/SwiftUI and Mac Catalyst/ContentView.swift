import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if UIDevice.current.userInterfaceIdiom == .phone {
                MobileView()
            } else {
                MacView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.init(rawValue: "iPhone 11 Pro"))
            
//            ContentView()
//                .previewLayout(.fixed(width: 2732, height: 2048))
        }
    }
}

struct MobileView: View {
    var body: some View {
        TabView {
            NavigationView {
                ListView()
                    .navigationBarTitle("Phone app")
            }
            .tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("Tab one")
            }
            .tag(1)
            
            Text("New view coming soon")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Tab one")
            }
            .tag(1)
        }
    }
}

struct ListView: View {
    var body: some View {
        List {
            Text("Hello, iPhone!")
        }
    }
}

//MARK: - Mac Views
struct MacView: View {
    var body: some View {
        NavigationView {
            ListView()
            Text("Details coming soon?")
        }
    }
}
