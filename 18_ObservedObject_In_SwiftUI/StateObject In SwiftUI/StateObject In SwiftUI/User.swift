//
//  User.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import Foundation

struct User: Equatable {
    var username: String
    var password: String
    
    static let empty = User(username: "", password: "")
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username && lhs.password == rhs.password
    }
}



