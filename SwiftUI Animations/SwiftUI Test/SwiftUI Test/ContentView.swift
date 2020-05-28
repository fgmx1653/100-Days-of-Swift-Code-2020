import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300)
                .cornerRadius(8)
                .aspectRatio(2/3, contentMode: .fit)
                .rotation3DEffect(Angle(degrees: isTapped ? 72 : 0), axis: (x: 72, y: 0, z: 0))
                .animation(.spring())
                .onTapGesture {
                    self.isTapped.toggle()
            }
            
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .offset(y: isTapped ? 0 : -400)
                .animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
