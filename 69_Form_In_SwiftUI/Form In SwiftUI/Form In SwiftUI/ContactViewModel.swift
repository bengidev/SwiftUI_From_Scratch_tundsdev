//
//  ContactViewModel.swift
//  Form In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import Foundation

@MainActor
final class ContactViewModel: ObservableObject {
    @Published private (set) var contacts: [Contact] = []
    @Published private (set) var currentContact: Contact = .empty
    
    var isContactValid: Bool {
        let general = self.currentContact.general
        
        return general.title.isNotEmpty &&
            general.firstName.isNotEmpty &&
            general.lastName.isNotEmpty &&
            general.gender.rawValue.isNotEmpty
    }
    
    var isContactNotValid: Bool { return !self.isContactValid }
    
    func addContact(_ contact: Contact) -> Void {
        self.contacts.append(contact)
    }
    
    func changeContact(with contact: Contact) -> Void {
        self.currentContact = contact
    }
    
    func resetContact() -> Void {
        self.currentContact = .empty
    }
}
