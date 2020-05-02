import SwiftUI

struct ContentView: View {
    let cards = ["001", "002"]
    @State private var cardState = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(cardState ? cards[0] : cards[1])
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button(action: {
                self.cardState.toggle()
            }) {
                Color(.clear)
            }
            .frame(width: 33, height: 44)
            .padding(.leading, 148)
            .padding(.top, -55)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
