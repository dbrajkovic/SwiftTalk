//: [Previous](@previous)
//: # Types
//: ## Optionals
var hoursSlept: Double? = 1
let response: String
if let sleepingHours = hoursSlept {
    response = "I slept for \(sleepingHours) hour\(sleepingHours > 1 ? "s" : "" ) last night."
} else {
    response = "I couldn't sleep at all last night!"
}
print(response)
//: ## Optional Chaining
var techTalkAttendees: [String]?
print("\(techTalkAttendees?.count) attended today.")


import UIKit


//: [Next](@next)
