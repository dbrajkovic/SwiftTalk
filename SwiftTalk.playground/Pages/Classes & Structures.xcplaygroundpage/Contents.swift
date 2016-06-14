/*:
 [Previous](@previous)
 # Classes & Structures
 ## Defining
 */

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    init(resolution: Resolution) {
        self.resolution = resolution
    }
}

// # Accessing and assigning properties

// # Type: Value vs. Reference

//: [Next](@next)
