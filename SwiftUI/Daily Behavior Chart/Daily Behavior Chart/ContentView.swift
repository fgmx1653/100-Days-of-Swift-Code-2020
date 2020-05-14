import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .phone {
                Text("Hello, iPhone!")
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
