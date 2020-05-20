struct MemoryGame<CarContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, carContentFactory: (Int) -> CarContent) {
        cards = Array<Card>()
        
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = carContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CarContent
        var id: Int
    }
}
