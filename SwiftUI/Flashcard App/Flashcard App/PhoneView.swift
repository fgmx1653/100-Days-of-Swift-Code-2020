import SwiftUI

struct PhoneView: View {
    @Binding var currentList: Int
    @Binding var isSettingsOpen: Bool
    
    var body: some View {
        TabView {
            CardView(currentList: $currentList)
                .tabItem {
                    Image(systemName: "rectangle.fill.on.rectangle.angled.fill")
                    Text("Flash Cards")
            }
            .tag(1)
            
            NavigationView {
                ListView(currentList: $currentList)
                    .navigationBarTitle("Sight Words List")
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Sight Words")
            }
            .tag(2)
            
            SettingsView(isSettingsOpen: $isSettingsOpen)
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("App Info")
            }
            .tag(3)
        }
    }
}

struct PhoneView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneView(currentList: Binding.constant(0), isSettingsOpen: Binding.constant(true))
    }
}
