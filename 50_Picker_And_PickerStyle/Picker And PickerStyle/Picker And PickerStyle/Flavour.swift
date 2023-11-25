//
//  Flavour.swift
//  Picker And PickerStyle
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import Foundation

struct Flavour: Hashable, Identifiable {
    let id = UUID()
    
    let name: String
    let price: Decimal
}

extension Flavour {
    static let empty = Flavour(name: "Unknown", price: 0.0)
    
    static let examples: [Flavour] = [
        Flavour(name: "Chocolate", price: 7.5),
        Flavour(name: "Strawberry", price: 6.25),
        Flavour(name: "Banana", price: 5.0),
    ]
}
