import SwiftUI

struct ContentView: View {
    @AppStorage("whatsNewView") var isWhatsNewsShowing = true
    
    var body: some View {
        Text("Hello, World!")
            .sheet(isPresented: $isWhatsNewsShowing) {
                WhatsNewView(isWhatsNewsShowing: self.$isWhatsNewsShowing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
