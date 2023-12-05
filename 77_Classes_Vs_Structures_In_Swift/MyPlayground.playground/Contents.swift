import Cocoa

var greeting = "Hello, playground"
dump(greeting, name: "Greeting")
// ====================== COMPONENT SEPARATOR==============================

struct Car {
    let name: String
    var mile: Int
    
    mutating func increaseMiles(for value: Int ) -> Void {
        self.mile += value
    }
}

var firstCar = Car(name: "Supra", mile: 100)
dump(firstCar, name: "First Car")

var secondCar = Car(name: "Mazda", mile: 45)
dump(secondCar, name: "Second Car")

// This will copy its `firstCar` value data rather than its reference data
// So, when `thirdCar` changes its values, `firstCar` values will be same as before.
//
var thirdCar = firstCar
dump(thirdCar, name: "Third Car")
thirdCar.mile = 145
dump(thirdCar, name: "Third Car")
dump(firstCar, name: "First Car")

firstCar.increaseMiles(for: 65)
dump(firstCar, name: "First Car")
dump(thirdCar, name: "Third Car")

// ====================== COMPONENT SEPARATOR==============================

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let firstPerson = Person(name: "First Person", age: 21)
dump(firstPerson, name: "First Person")

// This will copy its `firstPerson` reference data rather than its value data
// So, when `secondPerson` changes its values, `firstPerson` values will be same as `secondPerson` values.
//
let secondPerson = firstPerson
dump(secondPerson, name: "Second Person")

secondPerson.name = "Second Person"
secondPerson.age = 24
dump(firstPerson, name: "First Person")
dump(secondPerson, name: "Second Person")
