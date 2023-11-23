//
//  Model.swift
//  Refreshable In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 23/11/23.
//

import Foundation

enum AnimalType: String {
    case amphibian = "Amphibian"
    case mammal = "Mammal"
    case reptile = "Reptile"
    case fish = "Fish"
    case bird = "Bird"
}

struct AnimalFamily: Hashable, Identifiable, Comparable {
    let id = UUID()
    let type: AnimalType
    let animals: [Animal]
    
    static let empty = AnimalFamily(type: .amphibian, animals: [Animal.empty])
    
    static func < (lhs: AnimalFamily, rhs: AnimalFamily) -> Bool {
        return lhs.type.rawValue < rhs.type.rawValue
    }
    
    static func == (lhs: AnimalFamily, rhs: AnimalFamily) -> Bool {
        return lhs.type.rawValue == rhs.type.rawValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.type.rawValue)
    }
    
}

struct Animal: Hashable, Identifiable, Comparable {
    let id = UUID()
    let name: String
    
    static let empty = Animal(name: "Unknown")
    
    static func < (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
    
}
