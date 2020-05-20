class EmojiMemoryGame {
    private var model = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "💀", "🧟‍♀️", "👹"]
        let randomEmojis = Int.random(in: emojis.indices)
        
        return MemoryGame<String>(numberOfPairsOfCards: randomEmojis < 2 ? 2 : randomEmojis) { pairIndex in
            emojis[pairIndex]
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
