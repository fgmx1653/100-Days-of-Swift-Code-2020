import SwiftUI

struct PadView: View {
    @Binding var currentList: Int
    @State private var isSettingsOpen = false
    
    var body: some View {
        NavigationView {
            ListView(currentList: $currentList)
                .navigationBarTitle("Sight Words List")
                .navigationBarItems(leading: Button(action: {
                    self.isSettingsOpen.toggle()
                }, label: {
                    Image(systemName: "info.circle")
                }))
                .sheet(isPresented: $isSettingsOpen) {
                    SettingsView(isSettingsOpen: self.$isSettingsOpen)
            }
            
            CardView(currentList: $currentList)
        }
    }
}

struct PadView_Previews: PreviewProvider {
    static var previews: some View {
        PadView(currentList: Binding.constant(0))
    }
}
