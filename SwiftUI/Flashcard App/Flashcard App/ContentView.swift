import SwiftUI

struct ContentView: View {
    @State private var currentList = 0
    
    var body: some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .phone {
                PhoneView(currentList: $currentList, isSettingsOpen: Binding.constant(true))
            } else {
                PadView(currentList: $currentList)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
