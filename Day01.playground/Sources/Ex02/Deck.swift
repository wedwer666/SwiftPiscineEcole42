//import Foundation
//
//import 

import Foundation

public class Deck : NSObject {
    public static let AllSpades = Value.allValues.map{Card(c: Color.spade, v: $0)}
    public static let AllHearts = Value.allValues.map{Card(c: Color.heart, v: $0)}
    public static let AllClubs = Value.allValues.map{Card(c: Color.club, v: $0)}
    public static let AllDiamons = Value.allValues.map{Card(c: Color.diamond, v: $0)}
    public static var allCards : [Card] = AllSpades + AllDiamons + AllHearts + AllClubs
}

