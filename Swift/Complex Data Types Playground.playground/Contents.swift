// Arrays
let operatingSystems = ["iOS", "iPadOS", "macOS", "watchOS", "tvOS"]
operatingSystems[2] // macOS

// Sets
let names = Set(["Steve", "Tim"])
print(names) // prints ["Tim", "Steve"]

// Tuples
let ceo = (name: "Tim Cook", age: 59)
ceo.name

// Dictionaries
let iPhones = [
    "iPhone 11 and 11 Pro": 2019,
    "iPhone XR": 2018
]
iPhones["iPhone XR"]

// Enums
enum Result {
    case success
    case failure
}

let result = Result.success
