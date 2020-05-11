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
    @State private var word: CGFloat = 0
    let wordsList = ["a", "about", "all", "an", "and", "are", "as", "at", "be", "been", "but", "by", "called", "can", "come", "could", "day", "did", "do", "down", "each", "find", "first", "for", "from", "get", "go", "had", "has", "have", "he", "her", "him", "his", "how", "I", "if", "in", "into", "is", "it", "like", "long", "look", "made", "make", "many", "may", "more", "my", "no", "not", "now", "number", "of", "oil", "on", "one", "or", "other", "out", "part", "people", "said", "see", "she", "sit", "so", "some", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "time", "to", "two", "up", "use", "was", "water", "way", "we", "were", "what", "when", "which", "who", "will", "with", "words", "would", "write", "you", "your"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Spacer()
                Text(word < 100 ? wordsList[Int(word)] : "Tap to\nstart again!")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 64,
                           height: UIScreen.main.bounds.width - 64)
                    .background(Color.white)
                    .cornerRadius(39)
                    .onTapGesture {
                        if self.word < 100 {
                            self.word += 1
                        } else if self.word == 100 {
                            self.word = 0
                        }
                }
                
                Spacer()
                HStack {
                    ZStack(alignment: .leading) {
                        Capsule()
                            .foregroundColor(.black)
                            .opacity(0.6)
                        
                        Capsule()
                            .foregroundColor(.white)
                            .frame(width: word)
                    }
                    .frame(width: 100, height: 8)
                    
                    Text("\(100 - Int(word)) words left")
                        .foregroundColor(.white)
                    
                    Spacer()
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "speaker.3.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 64)
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
