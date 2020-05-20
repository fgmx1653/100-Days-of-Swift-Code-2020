class EmojiMemoryGame {
    private var model = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "💀", "🧟‍♀️", "👹"]
        let randomEmojis = Int.random(in: emojis.indices)
        
        if randomEmojis < 2 {
            return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
                emojis[pairIndex]
            }
        } else {
            return MemoryGame<String>(numberOfPairsOfCards: randomEmojis) { pairIndex in
                emojis[pairIndex]
            }
        }
    }
    
    // MARK: - Model access
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
