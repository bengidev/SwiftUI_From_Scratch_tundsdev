//
//  User.swift
//  TextField And SecureField
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import Foundation

struct User: Codable, Equatable {
    var username: String
    var password: String
    
    internal init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    static let empty = User(username: "", password: "")
    
    enum CodingKeys: CodingKey {
        case username
        case password
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<User.CodingKeys> = try decoder.container(keyedBy: User.CodingKeys.self)
        
        self.username = try container.decode(String.self, forKey: User.CodingKeys.username)
        self.password = try container.decode(String.self, forKey: User.CodingKeys.password)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<User.CodingKeys> = encoder.container(keyedBy: User.CodingKeys.self)
        
        try container.encode(self.username, forKey: User.CodingKeys.username)
        try container.encode(self.password, forKey: User.CodingKeys.password)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username &&
        lhs.password == rhs.password
    }
}
