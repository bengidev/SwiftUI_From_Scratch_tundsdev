//
//  User.swift
//  API Call MVVM Combine
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import Foundation

struct User: Hashable, Identifiable ,Codable {
    let id: Int
    let name: String
    let email: String
    let company: Company
    
    static let empty: User = .init(id: 0, name: "", email: "", company: .empty)
}

extension User {
    struct Company: Hashable, Identifiable ,Codable {
        var id = UUID()
        let name: String
        let tag: String
        let headline: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case tag = "catchPhrase"
            case headline = "bs"
        }
        
        static let empty: Company = .init(name: "", tag: "", headline: "")
    }
}
