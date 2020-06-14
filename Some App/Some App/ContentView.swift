import SwiftUI

struct ContentView: View {
    @State private var selection = 4
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Tab Content 1")
                .tabItem {
                    Image(systemName: "map")
                    Text("Dash")
            }.tag(0)
            Text("Tab Content 2")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
            }.tag(1)
            Text("Tab Content 3")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
            }.tag(2)
            Text("Tab Content 4")
                .tabItem {
                    Image(systemName: "star")
                    Text("Ratings")
            }.tag(3)
            EarningsView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Earnings")
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - New .swift file.
struct EarningsView: View {
    let febWeeks = [
        Week(date: "Current week", pay: "$942.27"),
        Week(date: "Feb 18 - Feb 24", pay: "$242.27"),
        Week(date: "Feb 11 - Feb 17", pay: "$1,342.27"),
        Week(date: "Feb 4 - Feb 10", pay: "$1,342.27")
    ]
    
    let janWeeks = [
        Week(date: "Jan 28 - Feb 3", pay: "$142.27"),
        Week(date: "Jan 21 - Jan 27", pay: "$242.27"),
        Week(date: "Jan 14 - Jan 20", pay: "$1,342.27"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Current week")
                        .font(.title)
                        .bold()
                    
                    Text("$942.27")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.green)
                }
                MonthView(monthLabel: "February", weeks: febWeeks)
                MonthView(monthLabel: "January", weeks: janWeeks)
                
            }
            .navigationBarTitle("Earnings", displayMode: .inline)
        }
    }
}

//MARK: - New .swift file.
struct MonthView: View {
    let monthLabel: String
    let weeks: [Week]
    
    var body: some View {
        Group {
            Text(monthLabel)
                .font(.title)
                .bold()
                .padding(.vertical)
            
            ForEach(weeks, id: \.self) { week in
                NavigationLink(destination: Text("Coming soon")) {
                    Text(week.date)
                    Spacer()
                    Text(week.pay)
                }
            }
        }
    }
}

//MARK: - New .swift file.
struct Week: Hashable {
    let date: String
    let pay: String
}
