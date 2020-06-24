import SwiftUI

struct ContentView: View {
    @State private var isToggleOneOne = false
    @State private var isToggleTwoOne = false
    @State private var isExpanded = false
    
    var body: some View {
        NavigationView {
            List {
                DisclosureGroup("Items", isExpanded: $isExpanded) {
                    Toggle("One", isOn: $isToggleOneOne)
                    Toggle("Two", isOn: $isToggleTwoOne)
                }
                
                if isToggleOneOne {
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Text("Navigate")
                        })
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
