// For loops
let count = 1...100

for number in count {
    print(number)
}

// While loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

// Repeat loops
repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// Exiting loops

while number <= 120 {
    print("\(number) is less then 120")
    
    if number == 101 {
        print("Let's exit.")
        break
    }
}
