/*:
 [Previous](@previous)
 # Enumerations
 ## Defining
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.south

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// ## Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// ## Raw Values

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//: [Next](@next)
