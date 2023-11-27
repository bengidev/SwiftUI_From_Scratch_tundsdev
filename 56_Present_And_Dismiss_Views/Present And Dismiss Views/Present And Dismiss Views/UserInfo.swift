//
//  UserInfo.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import Foundation

struct UserInfo: Hashable, Identifiable {
    let id = UUID()
    
    let firstName: String
    let lastName: String
    let gender: Gender
    
    enum Gender: String, Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        
        case male = "Male"
        case female = "Female"
        case preferNotToSay = "Prefer not to say"
    }
}

extension UserInfo {
    static let empty: UserInfo = UserInfo(firstName: "Unknown", lastName: "Unknown", gender: .preferNotToSay)
    
    static let examples: [UserInfo] = [
        UserInfo(firstName: "First", lastName: "Person", gender: .male),
        UserInfo(firstName: "Second", lastName: "Person", gender: .female),
        UserInfo(firstName: "Third", lastName: "Person", gender: .preferNotToSay),
        UserInfo(firstName: "Fourth", lastName: "Person", gender: .female),
        UserInfo(firstName: "Fifth", lastName: "Person", gender: .female),
    ]
}
