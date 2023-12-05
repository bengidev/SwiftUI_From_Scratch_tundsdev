//
//  Model.swift
//  Simple Model View ViewModel
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import Foundation

struct Model: Hashable, Identifiable {
    let id = UUID()
    var number: Int
    
    static let standard: Model = .init(number: 0)
    
    mutating func increment(by value: Int) -> Void {
        self.number += value
    }
}
