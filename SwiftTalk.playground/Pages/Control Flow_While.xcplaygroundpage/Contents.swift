/*:
 [Previous](@previous)
 # Control Flow
 ## While
 */
let finish = 100.0
let speed = 3.5
var position = 0.0

while position < finish {
    position += speed
}

var mySonsHair = Hair(percentageOfGrime: 0.6)

repeat {
    mySonsHair = mySonsHair.washRinse()
    mySonsHair.percentageOfGrime
} while mySonsHair.percentageOfGrime > 0.1
//: [Next](@next)