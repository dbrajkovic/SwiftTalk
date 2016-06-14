/*: 
 [Previous](@previous)
 # Variables, Constants & Operators...Oh my!
 ## Operators
 ### Custom Operators
 */
prefix operator +++ {}

prefix func +++ (inout integer: Int) -> Int {
    integer += integer
    return integer
}
var foo = 32
let doubleFoo = +++foo
foo
//: [Next](@next)
