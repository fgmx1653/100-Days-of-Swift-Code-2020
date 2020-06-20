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
                    Image(systemName: "rectangle.on.rectangle")
                    Text("Updates")
            }
            .tag(1)
            
            Text("Tab Content 3")
                .tabItem {
                    Image(systemName: "bandage")
                    Text("Medications")
            }
            .tag(2)
            
            Text("Tab Content 4")
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("More")
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    let days = [
        Day(day: "Mon", number: "4"),
        Day(day: "Tu", number: "5"),
        Day(day: "Wed", number: "6"),
        Day(day: "Thu", number: "7"),
        Day(day: "Fri", number: "8"),
        Day(day: "Sat", number: "9"),
        Day(day: "Sun", number: "10"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ForEach(days, id: \.self) { currentDay in
                        VStack {
                            Text(currentDay.day)
                            Text(currentDay.number)
                                .font(.title)
                                .padding()
                                .foregroundColor(currentDay.number == "4" ? .white : Color(.label))
                                .background(currentDay.number == "4" ? Color.blue : Color(.systemBackground))
                                .clipShape(Circle())
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct Day: Hashable {
    let day: String
    let number: String
}
