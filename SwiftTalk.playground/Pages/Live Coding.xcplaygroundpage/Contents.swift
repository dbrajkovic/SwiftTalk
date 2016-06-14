//: [Previous](@previous)

/*:
# Modeling Super Heros with Protocols and Protocol Extensions
 * Superman
 * Batman
 * Aquaman
*/
import Foundation

/* It would be tempting to reach for a "Superhero" class right from the start, but let's start out with protocols & see how far they'll get us.

protocol Superhero { }
*/

/* One very obvious thing that superheros have in common is that they each have a name

protocol Superhero: Named { }

protocol Named {
    var name: String { get }
}
*/

/* While it's true that all superheros have a name, some have a secret identity or can alter ego: 
*/

protocol Superhero: Named { }

protocol Named {
    var name: String { get }
}

protocol SecretSuperhero: Superhero {
    var alterEgo: String { get }
}

/* Let's start looking at their abilities as super. Superman can fly and Aquaman can swim. 
 
 Flyer and Swimmer involve action so lets add functions to support those actions.

protocol Flyer {
    func fly() -> String
}

protocol Swimmer {
    func swim() -> String
}
 */

/* These two protcols establish contracts for the action that they support, but it would be really useful to have default implementations for each. 
 
protocol Flyer {
    func fly() -> String
}

protocol Swimmer {
    func swim() -> String
}
extension Flyer {
    func fly() -> String {
        return "I'm flying"
    }
}

extension Swimmer {
    func swim() -> String {
        return "I'm swimming"
    }
}
 */

/* It's pretty dull that our default implementation doesn't do very much so let's help ourselves out by combining the protocols to work together */
 
protocol Flyer: Named {
    func fly() -> String
}

protocol Swimmer: Named {
    func swim() -> String
}
extension Flyer {
    func fly() -> String {
        return "\(name) is flying"
    }
}

extension Swimmer {
    func swim() -> String {
        return "\(name) is swimming"
    }
}

/* Now we've got some pretty good building blocks here, but our superhero's can't do anything yet. */

protocol FlyingSuperhero: Superhero, Flyer { }

protocol SwimmingSuperhero: Superhero, Swimmer { }

/* Now we've got several protocols and a couple of extensions with default implementations, let's start creating somethig more concrete: */

struct Atlantian: SwimmingSuperhero {
    let name: String
}

let aquaman = Atlantian(name: "Aquaman")
aquaman.name
aquaman.swim()

/* now I don't know why Aquaman is so lucky, he just gets to go around being himself all of the time but we know that Batman and Superman don't have it so easy... 

struct Kryptonian: FlyingSuperhero, SecretSuperhero {
    let name: String
    let alterEgo: String
}
 */

struct Kryptonian: FlyingSuperhero, SecretSuperhero {
    let name: String
    let alterEgo: String
    func fly() -> String {
        return "Look, up in the sky! It's a bird, it's a plane! It's \(name)!"
    }
}

struct Vigilante: SecretSuperhero {
    let name: String
    let alterEgo: String
}

let sonOfJorEl = Kryptonian(name: "Superman", alterEgo: "Clark Kent")
let theBatman = Vigilante(name: "Batman", alterEgo: "Bruce Wayne")

/* The only thing better than a superhero is a team of superheroes */

let theJusticeLeague: [Superhero] = [sonOfJorEl, aquaman, theBatman]

/* One of the benefits of having an alter ego, of course, is that you get to go out in public and hang out with your super buddies at the local coffee shop */
let herosWithAlterEgos = theJusticeLeague.map { $0 as? SecretSuperhero }.filter { $0 != nil }.map { $0!.alterEgo }
let secretMeeting = "\(herosWithAlterEgos) meet over coffee to discuss strategy"

/* now after the secret meeting is done our heros want to go home and let's face it, the city bus just isn't going to do */

sonOfJorEl.fly()

/* Now Batman sees all of the fun that Superman is having and he wants in on the flying action himself */

struct Aircraft: Flyer {
    let name: String
    let pilot: Named
    
    func fly() -> String {
        return "\(pilot.name) takes off in \(name)"
    }
}

let theBatplane = Aircraft(name: "The Batplane", pilot: theBatman)
theBatplane.fly()


/*
import Foundation

protocol Named {
    var name: String { get }
}

protocol Flight {
    func takeOff() -> String
}

protocol NamedFlyer: Named, Flight {
    var name: String { get }
    func takeOff() -> String
}

extension NamedFlyer {
    func takeOff() -> String {
        return "\(name) is taking off"
    }
}

protocol SuperHero: Named { }

protocol SecretSuperHero: SuperHero {
    var alterEgo: String { get }
}

protocol FlyingSuperHero: SecretSuperHero, Flight {
    
}

extension FlyingSuperHero {
    func takeOff() -> String {
        return "\(name) is taking off"
    }
}

struct Kryptonian: SecretSuperHero, Flight {
    
    let name: String
    let alterEgo: String
    
    func takeOff() -> String {
        return "Look up in the sky! It's a bird! it's a plane! It's \(name)!"
    }
}

struct Atlantian:  SuperHero /* swimming */ { // no secret identity!
    let name: String
}

struct Plane: NamedFlyer {
    let name: String
}

struct Vigliante: SecretSuperHero, Flight {
    var name: String
    var alterEgo: String
    var flyingVehicle: Plane
    
    func takeOff() -> String {
        return "\(name) jumps into the \(flyingVehicle.name)!"
    }
}

let aquaman = Atlantian(name: "Aquaman")
aquaman.name

let sonOfJorEl = Kryptonian(name: "Superman", alterEgo: "Clark Kent")
let theBatman = Vigliante(name: "The Batman", alterEgo: "Bruce Wayne", flyingVehicle: Plane(name: "Batplane"))

let heros: [SecretSuperHero] = [sonOfJorEl, theBatman]

let secretMeeting = "\(heros.map { return $0.alterEgo }) meet to discuss strategy over coffee"

theBatman.takeOff()
sonOfJorEl.takeOff()
 */
//: [Next](@next)
