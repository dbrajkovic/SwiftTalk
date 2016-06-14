/*:
 [Previous](@previous)
 # Types
 ## Sets
 */
var numbers = Set<Int>()
numbers.insert(3)

var evenNumbers: Set = [2, 4, 6, 8]

// ### Accessing and Modifying Sets  (count, isEmpty, insert, remove)

// ## Interating over an array

// ## Set operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()

// ## Comparing sets
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)
//: [Next](@next)
