//: [Previous](@previous)

/*:
# Modeling Superheroes with Protocols and Protocol Extensions
 * Superman
 * Batman
 * Aquaman
*/
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

protocol SecretIdentity {
    var alterEgo: String { get }
}

protocol Named {
    var name: String { get }
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

protocol Flyer  {
    func fly() -> String
}

protocol Swimmer {
    func swim() -> String
}

extension Flyer {
    func fly() -> String {
        return "I am flying"
    }
}

extension Swimmer {
    func swim() -> String {
        return "I is swimming"
    }
}

/* Now we've got some pretty good building blocks here, but our superhero's can't do anything yet. */

//protocol FlyingSuperhero: Superhero, Flyer { }
//
//protocol SwimmingSuperhero: Superhero, Swimmer { }

/* Now we've got several protocols and a couple of extensions with default implementations, let's start creating somethig more concrete: */

struct Atlantian: Superhero, Swimmer {
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

struct Kryptonian: Superhero, Flyer, SecretIdentity {
    let name: String
    let alterEgo: String
    func fly() -> String {
        return "Look, up in the sky! It's a bird, it's a plane! It's \(name)!"
    }
}

struct Vigilante: Superhero, SecretIdentity {
    let name: String
    let alterEgo: String
}

let sonOfJorEl = Kryptonian(name: "Superman", alterEgo: "Clark Kent")
let theBatman = Vigilante(name: "Batman", alterEgo: "Bruce Wayne")

/* The only thing better than a superhero is a team of superheroes */

let theSuperFriends: [Superhero] = [sonOfJorEl, aquaman, theBatman]

/* One of the benefits of having an alter ego, of course, is that you get to go out in public and hang out with your super buddies at the local coffee shop */
let herosWithAlterEgos = theSuperFriends.map { $0 as? SecretIdentity }.filter { $0 != nil }.map { $0!.alterEgo }
let secretMeeting = "\(herosWithAlterEgos) meet over coffee to discuss strategy"

/* now after the secret meeting is done our heros want to go home and let's face it, the city bus just isn't going to do */

sonOfJorEl.fly()

/* Now Batman sees all of the fun that Superman is having and he wants in on the flying action himself */

struct Aircraft: Flyer, Named {
    let name: String
    let pilot: Named
    
    func fly() -> String {
        return "\(pilot.name) takes off in \(name)"
    }
}

let theBatplane = Aircraft(name: "The Batplane", pilot: theBatman)
theBatplane.fly()

protocol HeatVision {
    func zap(target: Named) -> String
}

extension Kryptonian : HeatVision {
    func zap(target: Named) -> String {
        return "\(name) zapped \(target.name) with heat vision!!!"
    }
}

sonOfJorEl.zap(theBatplane)

let laserEyes: HeatVision = sonOfJorEl



//: [Next](@next)
