//
//  Contact.swift
//  Form In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import Foundation

struct Contact: Hashable, Identifiable {
    let id = UUID()
    let general: General
    let contactInfo: ContactInfo
    let emergency: Emergency
    
    static let example: Contact = .init(general: .example,
                                           contactInfo: .example,
                                           emergency: .example)
    static let empty: Contact = .init(general: .empty,
                                           contactInfo: .empty,
                                           emergency: .empty)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Contact {
    struct General: Hashable, Identifiable {
        let id = UUID()
        let title: String
        let firstName: String
        let lastName: String
        let gender: Gender
        let company: String
        
        static let example: General = .init(title: "Unknown",
                                            firstName: "Unknown",
                                            lastName: "Unknown",
                                            gender: .unknown,
                                            company: "Unknown")
        static let empty: General = .init(title: "",
                                            firstName: "",
                                            lastName: "",
                                            gender: .unknown,
                                            company: "")
    }
}

extension Contact.General {
    enum Gender: String, Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case male = "Male"
        case female = "Female"
        case unknown = "Prefer not to say"
    }
}

extension Contact {
    struct ContactInfo: Hashable, Identifiable {
        let id = UUID()
        let phoneNumber: Int
        let email: String
        
        static let example: ContactInfo = .init(phoneNumber: 0,
                                                email: "unknown@mail.com")
        static let empty: ContactInfo = .init(phoneNumber: 0,
                                                email: "")
    }
}

extension Contact {
    struct Emergency: Hashable, Identifiable {
        let id = UUID()
        let isEmergency: Bool
        let notes: String
        
        static let example: Emergency = .init(isEmergency: true, notes: "Unknown")
        static let empty: Emergency = .init(isEmergency: false, notes: "")
    }
}
