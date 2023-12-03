//
//  AddContactView.swift
//  Form In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import SwiftUI

typealias Action = (() -> Void)
typealias ContactGeneral = Contact.General
typealias ContactInfo = Contact.ContactInfo
typealias ContactEmergency = Contact.Emergency
typealias ContactGender = Contact.General.Gender

struct AddContactView: View {
    @EnvironmentObject var vm: ContactViewModel
    
    var didTapDoneButton: ((Contact) -> Void) = { _ in }
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var titleValue: String = String()
    @State private var firstNameValue: String = String()
    @State private var lastNameValue: String = String()
    @State private var genderValue: ContactGender = .unknown
    @State private var companyValue: String = String()
    
    @State private var phoneNumberValue: String = String()
    @State private var emailValue: String = String()
    
    @State private var isEmergency: Bool = false
    @State private var notesValue: String = String()
    
    @FocusState private var isResetPerformed: Bool
    
    var body: some View {
        NavigationView {
            Form {
                self.generalSectionView()
                self.contactInfoSectionView()
                self.emergencySectionView()
                self.clearAllButton(action: self.resetCurrentFormData)
            }
            .animation(.easeInOut, value: self.vm.currentContact)
            .focused(self.$isResetPerformed)
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Done", action: self.onDoneTapped)
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel, action: self.onCancelTapped)
                }
            }
        }
    }
}

#Preview {
    AddContactView()
        .environmentObject(ContactViewModel())
}

private extension AddContactView {
    @ViewBuilder
    private func generalSectionView() -> some View {
        Section {
            TextField("Title", text: self.$titleValue)
                .textContentType(.namePrefix)
            
            TextField("First Name", text: self.$firstNameValue)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            
            TextField("Last Name", text: self.$lastNameValue)
                .textContentType(.familyName)
                .keyboardType(.namePhonePad)
            
            Picker("Gender", selection: self.$genderValue) {
                ForEach(ContactGender.allCases) { gender in
                    Text(gender.rawValue)
                }
            }
            .pickerStyle(.automatic)
            
            TextField("(Optional) company", text: self.$companyValue)
                .textContentType(.organizationName)
        } header: {
            Text("General")
        } footer: {
            Text("Please enter in any information about the person")
        }
        .headerProminence(.increased)
    }
    
    @ViewBuilder
    private func contactInfoSectionView() -> some View {
        Section {
            TextField("Phone Number", text: self.$phoneNumberValue)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
            
            TextField("(Optional) Email", text: self.$emailValue)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
        }
    }
    
    @ViewBuilder
    private func emergencySectionView() -> some View {
        Section {
            Toggle("Emergency Contact", isOn: self.$isEmergency)
            
            TextEditor(text: self.$notesValue)
        } footer: {
            Text("Please enter in any information about this emergency contact ") +
            Text("that someone else should know")
        }
    }
    
    @ViewBuilder
    private func clearAllButton(action: @escaping Action = {}) -> some View {
        Button("Clear All", role: .destructive, action: action)
    }
    
}

private extension AddContactView {
    private func resetCurrentFormData() -> Void {
        withAnimation {
            self.titleValue = String()
            self.firstNameValue = String()
            self.lastNameValue = String()
            self.genderValue = .unknown
            self.companyValue = String()
            self.phoneNumberValue = String()
            self.emailValue = String()
            self.isEmergency = false
            self.notesValue = String()
            
            self.vm.resetContact()
            
            self.isResetPerformed = false
        }
    }
    
    private func onCancelTapped() -> Void {
        self.dismiss()
    }

    private func onDoneTapped() -> Void {
        let general = ContactGeneral.init(
            title: self.titleValue,
            firstName: self.firstNameValue,
            lastName: self.lastNameValue,
            gender: self.genderValue,
            company: self.companyValue
        )
        let contactInfo = ContactInfo.init(
            phoneNumber: Int(self.phoneNumberValue) ?? 0,
            email: self.emailValue
        )
        let emergency = ContactEmergency.init(
            isEmergency: self.isEmergency,
            notes: self.notesValue
        )
        
        self.vm.changeContact(with: .init(
            general: general,
            contactInfo: contactInfo,
            emergency: emergency)
        )
        
        guard self.vm.isContactValid else { return }
        
        self.dismiss()
        self.didTapDoneButton(self.vm.currentContact)
    }
}
