//
//  Person.swift
//  ForEach With Identifiable
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    
    let firstName: String
    let lastName: String
}

extension Person {
    static let empty = Person(firstName: "Unknown", lastName: "Unknown")
    
    static var example = [
        Person(firstName: "First", lastName: "Person"),
        Person(firstName: "Second", lastName: "Person"),
        Person(firstName: "Third", lastName: "Person"),
        Person(firstName: "Third", lastName: "Third"),
    ]
}
