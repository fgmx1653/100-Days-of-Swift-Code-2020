import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView("Loading...")
            } else {
                Button(action: { isLoading.toggle() }, label: {
                    Text("Login")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 160, height: 60)
                        .background(Color.blue)
                        .cornerRadius(8)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
