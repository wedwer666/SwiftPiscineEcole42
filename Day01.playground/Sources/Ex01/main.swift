import Foundation


var card1 = Card(c: Color.spade, v: Value.ace)
var card2 = Card(c: Color.heart, v: Value.two)

print(card1.description)
print(card2.description)

print (card1 == card2)


