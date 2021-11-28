import UIKit

enum CradColor: String{
    case Red = "Red"
    case Blue = "Blue"
    case Green = "Green"
}


struct Card{
    var color: CradColor
    var roll: Int
    
    init(color: CradColor){
        self.color = color
        switch(color){
        case .Red:
            roll = Int.random(in: 1...2)
        case .Blue:
            roll = Int.random(in: 3...4)
        case .Green:
            roll = Int.random(in: 5...6)
        }
    }
}


class Deck{
    var cards: [Card] = []
    
    init(){
        for i in 1...30{
            if i <= 10{
                cards.append(Card(color: CradColor.Red))
            }
            else if i <= 20{
                cards.append(Card(color: CradColor.Blue))
            }
            else{
                cards.append(Card(color: CradColor.Green))
            }
        }
    }
    
    func deal() -> Card{
        return cards.removeLast()
    }
    
    func isEmpty() -> Bool{
        return cards.count == 0
    }
    
    func shuffle(){
        cards.shuffle()
    }
}


class Player{
    var name: String = ""
    var hand: [Card] = []
    
    
    func draw(deck: Deck) -> Card{
        if !deck.isEmpty(){
            let card = deck.deal()
            hand.append(card)
            return card
        }
        return Card(color: CradColor.Blue)
    }
    
    func rollDice() -> Int{
        return Int.random(in: 1...6)
    }
    
    func matchingCards(color: String, roll: Int) -> Int{
        var cardCounter = 0
        
        for card in hand{
            if card.roll == roll && card.color.rawValue == color{
                cardCounter += 1
            }
        }
        return cardCounter
    }
}


