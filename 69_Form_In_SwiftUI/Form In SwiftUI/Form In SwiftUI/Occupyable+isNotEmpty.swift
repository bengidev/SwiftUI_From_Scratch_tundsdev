//
//  Occupyable+isNotEmpty.swift
//  Form In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import Foundation

/// Source: https://github.com/artsy/Emergence/blob/master/Emergence/Extensions/Apple/Occupyable%2BisNotEmpty.swift
///

// Anything that can hold a value (strings, arrays, etc)
protocol Occupiable {
    var isEmpty: Bool { get }
    var isNotEmpty: Bool { get }
}

// Give a default implementation of isNotEmpty, so conformance only requires one implementation
extension Occupiable {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// I can't think of a way to combine these collection types. Suggestions welcome.
extension String: Occupiable { }
extension Array: Occupiable { }
extension Dictionary: Occupiable { }
extension Set: Occupiable { }

// Extend the idea of occupiability to optionals. Specifically, optionals wrapping occupiable things.
extension Optional where Wrapped: Occupiable {
    var isNilOrEmpty: Bool {
        switch self {
        case .none:
            return true
        case .some(let value):
            return value.isEmpty
        }
    }

    var isNotNilNotEmpty: Bool {
        return !isNilOrEmpty
    }
}
