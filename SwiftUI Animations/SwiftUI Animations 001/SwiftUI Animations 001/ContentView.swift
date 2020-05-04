import SwiftUI

struct ContentView: View {
    let colors = [Color.red, Color.orange, Color.blue, Color.purple]
    @State private var isOpen = false
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 72, height: 72)
            }
        }
        .frame(height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
