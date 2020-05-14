import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .phone {
                PhoneView()
            } else {
                Text("Hello, iPad or Mac!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PhoneView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0 ..< 5) { item in
                    CardView()
                }
            }
            .padding(.top)
            .navigationBarTitle("Daily Behavior Chart")
            .navigationBarItems(leading: Button(action: {
                //
            }) {
                Image(systemName: "plus.app.fill")
                    .font(.largeTitle)
            })
        }
    }
}

struct CardView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.crop.circle")
                .font(.largeTitle)
                .padding(.horizontal)
            
            Text("Hello, iPhone!")
                .offset(y: -6)
            
            Spacer()
            Image(systemName: "chevron.right")
                .font(Font.body.weight(.heavy))
                .foregroundColor(Color(.label))
                .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 72)
        .background(Color(.systemGray5))
        .cornerRadius(12)
    }
}
