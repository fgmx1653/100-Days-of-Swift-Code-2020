import SwiftUI

struct ContentView: View {
    @State private var isAddViewShowing = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchView()
                CategoryCardsView(isAddViewShowing: $isAddViewShowing)
            }
            .navigationBarTitle("Daily Tasks Reminder")
            .navigationBarItems(trailing: Button(action: buttonAction) {
                Text("Edit")
            })
                .sheet(isPresented: $isAddViewShowing) {
                    AddCardView(isAddViewShowing: self.$isAddViewShowing)
            }
        }
    }
    
    func buttonAction() {
        print("Edit")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
