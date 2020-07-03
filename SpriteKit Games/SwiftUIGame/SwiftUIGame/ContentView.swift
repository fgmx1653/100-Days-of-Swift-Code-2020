import SwiftUI

struct ContentView: View {
    @State private var isGameSceneVisible = false
    
    var body: some View {
        VStack {
            Button(action: { isGameSceneVisible.toggle() }, label: {
                Text("Play")
            })
        }
        .fullScreenCover(isPresented: $isGameSceneVisible) {
            //
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
