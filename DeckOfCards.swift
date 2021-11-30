enum Color {
    case red
    case blue
    case green
}

struct Card {
    var colors: Color
    var roll: Int

    init(colors: Color){
        self.colors = colors
        
        switch colors{
        case .blue: roll = Int.random(in: 1...2)
        case .red: roll = Int.random(in: 3...4)
        case .green: roll = Int.random(in: 4...6)
        }
    }
}

class Deck {
    var cards = [Card]()
    
    init(){
        for i in 1...10{
            cards.append(Card(color: .blue))
            cards.append(Card(color: .red))
            cards.append(Card(color: .green))
        }
    }
    
    func SelectTopMost() -> Card {
        return cards.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return cards.isEmpty
    }
    
    func shuffle() {
        cards.shuffle()
    }
}

class Player {
    var name: String
    var hand: [Card]
    
    init(name: String){
        self.name = name
        hand = [Card]()
    }
    
    func draw(deck: Deck) -> Card {
        hand.append(deck.SelectTopMost())
        return hand[hand.endIndex - 1]
    }
    
    func rollDice() -> Int {
        return Int.random(in: 1...6)
    }
    
    func matchingCards(color: Color, roll: Int) -> Int {
        var totalCards = 0
        for card in hand{
            if color == card.color && roll == card.roll{
                totalCards += 1
            }
        }
        return totalCards
    }
}
