/*:
 [Previous](@previous)
 # Functions
 ## Defining
 */
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

// ### Parameters: none, multiple, variadic, inout

// ### Return values: none, tuples

// ## Function Types

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// ## Nested Functions
//: [Next](@next)