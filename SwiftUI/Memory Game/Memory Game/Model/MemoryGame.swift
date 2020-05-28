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
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in 0 ..< cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0 // TODO: bogus!
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CarContent
        var id: Int
    }
}
