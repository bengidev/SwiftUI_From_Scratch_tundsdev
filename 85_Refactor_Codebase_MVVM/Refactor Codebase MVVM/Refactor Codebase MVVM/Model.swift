//
//  Model.swift
//  Refactor Codebase MVVM
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: User.Address
    let phone: String
    let website: String
    let company: User.Company
    
    static let empty: User = .init(
        id: 0,
        name: "",
        username: "",
        email: "",
        address: .empty,
        phone: "",
        website: "",
        company: .empty
    )
}

extension User {
    struct Address: Hashable, Identifiable, Codable {
        var id = UUID()
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
        
        static let empty: Address = .init(
            street: "",
            suite: "",
            city: "",
            zipcode: "",
            geo: .empty
        )
        
        enum CodingKeys: CodingKey {
            case street
            case suite
            case city
            case zipcode
            case geo
        }
    }
}

extension User {
    struct Company: Hashable, Identifiable, Codable {
        var id = UUID()
        let name: String
        let headline: String
        let motto: String
        
        static let empty: Company = .init(name: "", headline: "", motto: "")
        
        enum CodingKeys: String, CodingKey {
            case name
            case headline = "catchPhrase"
            case motto = "bs"
        }
    }
}

extension User {
    struct Geo: Hashable, Identifiable, Codable {
        var id = UUID()
        let latitude: String
        let longitude: String
        
        static let empty: Geo = .init(latitude: "", longitude: "")
        
        enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lng"
        }
    }
}

