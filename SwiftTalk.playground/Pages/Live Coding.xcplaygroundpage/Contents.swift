//: [Previous](@previous)


/*: * With inheritance, you define _what your classes are_.
    * With traits you define _what classes can do_.
*/

import Foundation

protocol Named {
    var name: String { get }
}

protocol Flight {
    func takeOff() -> String
}

protocol SuperHero: Named {
    var secretName: String { get }
}

extension SuperHero { // default has no secret identity
    var secretName: String {
        return name
    }
}

struct Kryptonian: SuperHero, Flight {
    
    let name: String
    let secretName: String
    
    func takeOff() -> String {
        return "Look up in the sky! It's a bird! it's a plane! It's \(name)!"
    }
}

struct Atlantian:  SuperHero /* swimming */ { // no secret identity!
    let name: String
}

struct Plane: Flight {
    let name: String
    
    func  takeOff() -> String {
        return "\(name) is taking off."
    }
}

struct Vigliante: SuperHero, Flight {
    var name: String
    var secretName: String
    var flyingVehicle: Plane
    
    func takeOff() -> String {
        return "\(name) jumps into the \(flyingVehicle.name)!"
    }
}

let aquaman = Atlantian(name: "Aquaman")
aquaman.secretName
aquaman.name

let sonOfJorEl = Kryptonian(name: "Superman", secretName: "Clark Kent")

let theBatman = Vigliante(name: "The Batman", secretName: "Bruce Wayne", flyingVehicle: Plane(name: "Batplane"))

theBatman.takeOff()
sonOfJorEl.takeOff()

struct ComicBook {
    let title: String
    let hero: SuperHero
}

//: [Next](@next)
