import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
            }
        }
        .font(.system(size: fontSize(for: size)))
        .aspectRatio(2/3, contentMode: .fit)
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.72
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(content: "👻", id: 0))
            .padding()
            .foregroundColor(.orange)
    }
}
