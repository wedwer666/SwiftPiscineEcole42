

import Foundation



public class Deck : NSObject {
    public static let AllSpades = Value.allValues.map{Card(c: Color.spade, v: $0)}
    public static let AllHearts = Value.allValues.map{Card(c: Color.heart, v: $0)}
    public static let AllClubs = Value.allValues.map{Card(c: Color.club, v: $0)}
    public static let AllDiamons = Value.allValues.map{Card(c: Color.diamond, v: $0)}
    public static var allCards : [Card] = AllSpades + AllDiamons + AllHearts + AllClubs
    public var cards: [Card] = []

    
    public override init(){
        self.cards = Deck.allCards
    }
    
    private func userDesc() -> String{
        var St:String = "\n[All Cards]\n"
        var i:Int = 1;
        for c in self.cards
        {
            St += "\(i): \(c.description) \n"
            i += 1
        }
        return St
    }
    
    override public var description: String {
        return userDesc()
    }
}

extension Array
{
    public mutating func shuffle()
    {
        if self.count < 2 { return }
        
        for i in self.startIndex ..< self.endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(self.endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}

//let d1 = Deck()
//
//print(d1.description)

