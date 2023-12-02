//
//  Person.swift
//  Search Bar In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import Foundation

struct Person: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let gender: Gender
    
    static let empty = Person(name: "Unknown", gender: .genderNeutral)
    
    enum Gender: String, Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case male = "👨"
        case female = "👩"
        case genderNeutral = "👱"
    }
}
