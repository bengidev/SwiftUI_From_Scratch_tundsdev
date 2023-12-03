import Cocoa

var greeting = "Hello, playground"
// ====================== COMPONENT SEPARATOR==============================



let helloGreeting = { () -> Void in
    print(greeting)
}

helloGreeting()
// ====================== COMPONENT SEPARATOR==============================



let nameGreeting = { (name: String) -> Void in
    print("Hello, \(name) from playground")
}

nameGreeting("Tester")
// ====================== COMPONENT SEPARATOR==============================



let reuseNameGreeting = { (name: String) -> (String) in
    let message = "Reuse Name Greeting with \(name)"
    return message
}

let reuseMessage = reuseNameGreeting("Tester")
print(reuseMessage)
// ====================== COMPONENT SEPARATOR==============================



let defaultGreeting = { () -> (String) in
    let message = "Default Greeting from playground"
    return message
}

let defaultMessage = defaultGreeting()
print(defaultMessage)
// ====================== COMPONENT SEPARATOR==============================



func fetchData(completion: @escaping (_ data: [String]) -> Void) -> Void {
    let fakeData = ["John", "Jake", "Jill"]
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        completion(fakeData)
    }
}

fetchData { data in
    print(data)
}
// ====================== COMPONENT SEPARATOR==============================

let fetch = { (_ data: [String]) -> Void in
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        print(data)
    }
}

fetch(["Bob", "Bill", "Bull"])
// ====================== COMPONENT SEPARATOR==============================
