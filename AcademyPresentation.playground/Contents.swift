import UIKit

/*:
 
 # All Cases of an enum?
 ## Much simpler now with CodeIterable
 
 */

enum AnimalTypes {
    case dog
    case cat
    case bird
     
     // sad: if you add a new case you have to add it to the below array which may lead to errors and insconsistencies
    static var allCases: [AnimalTypes] = [.dog, .cat, .bird]
}

AnimalTypes.allCases.count
AnimalTypes.allCases.forEach { print($0) }


/*:
 ### Conform to CaseIterable!
 */
enum Subject: CaseIterable {
    case math
    case english
    case science
}

/*:
 Now you can use the allCases with ease 🤩
 */
Subject.allCases.count
Subject.allCases.forEach {print($0)}



/*:
 # Warnings and Errors
 
 Now you can create warnings, very useful when working with teammates
 */

#warning("This sucks, make TransportationApp conform to CaseIterable https://developer.apple.com/documentation/swift/caseiterable")
enum TransportationApp {
    case uber
    case taxi
    case cabify
    
    static var allCases: [TransportationApp] = [.uber, .taxi, cabify]
}

/*:
 ### Create errors
 Great for when you provide some sort of framework or library to other developers and they have to fill in their own data. Example, firebase generics, devs need to get their own plist file from google. Example2, you have your api key, devs need their own
 */
//#error("You kiddind me right? Change this to 'Any iPhone'!!!")
let bestPhone = "Any Samsung"

/*:
 # Random number generation
 arc4random_uniform(3)????? - weird sintax, I personally never remember it by heart 💩 - from wwdc videos sometimes it was bias to other numbers?? like wtf
 
 Now every numeric type has a static random function that does the job for you
 */
Double.random(in: 1..<6)
Int.random(in: 5...9)

/*:
 Even with booleans 😎
 */
Bool.random()
/*:
 # COOLlection functions
 
 Shuffle() function, shuffles a collection
 */
var bestDevsInOder = ["Braun", "Bruno", "Homero", "Mocela", "Vedanin"]
bestDevsInOder.shuffle()

/*:
 Shuffled() function returns a collection shuffled based on another collection
 */
let lamestDevsInOrder = bestDevsInOder.shuffled()

/*:
random element in array
 */
//who gon put the big challenge on the store?
bestDevsInOder.randomElement()

/*:
 AllSatisfy function - return true of false if all elements of collection satify a predicate
 */
struct Exams {
    let grade: Int
    let subject: Subject
}

//Way to know if all elements of an array matches a certain predicate -> Returns true or false
var examsResults = [Exams(grade: 8, subject: .math), Exams(grade: 8, subject: .english), Exams(grade: 9, subject: .science)]

let passed = examsResults.allSatisfy { $0.grade >= 7 }

/*:
 Remove all where function - to remove elements on array that matches a certain predicate. Better performance than filter :)
 */
examsResults.removeAll { $0.grade <= 8 }
examsResults.forEach{print($0.subject)}


/*:
 Toggle function for boolean
 
 if you see someone doing something like:
 */
var isUserLoggedIn: Bool = true

if isUserLoggedIn {
    isUserLoggedIn = false
} else {
    isUserLoggedIn = true
}

//just give in a little sweet warning
#warning("Are you retarted? :) Just use toggle() :D")
isUserLoggedIn.toggle()
