//
//  AddContactView.swift
//  Form FocusState In SwiftUI
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
    
    @FocusState private var focusInputField: InputField?
    
    @State private var titleValue: String = String()
    @State private var firstNameValue: String = String()
    @State private var lastNameValue: String = String()
    @State private var genderValue: ContactGender = .unknown
    @State private var companyValue: String = String()
    
    @State private var phoneNumberValue: String = String()
    @State private var emailValue: String = String()
    
    @State private var isEmergency: Bool = false
    @State private var notesValue: String = String()
    
    var body: some View {
        NavigationView {
            Form {
                self.generalSectionView()
                self.contactInfoSectionView()
                self.emergencySectionView()
                self.clearAllButton(action: self.resetCurrentFormData)
            }
            .animation(.easeInOut, value: self.vm.currentContact)
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Save", action: self.onSaveTapped)
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel, action: self.onCancelTapped)
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Button(
                        "",
                        systemImage: "chevron.up",
                        action: self.onPreviousInputTapped
                    )
                    .labelsHidden()
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Button(
                        "",
                        systemImage: "chevron.down",
                        action: self.onNextInputTapped
                    )
                    .labelsHidden()
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done", action: self.onDoneTapped)
                }
            }
            .onAppear {
                self.focusInputField = .title
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
                .focused(self.$focusInputField, equals: .title)
            
            TextField("First Name", text: self.$firstNameValue)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
                .focused(self.$focusInputField, equals: .firstName)
            
            TextField("Last Name", text: self.$lastNameValue)
                .textContentType(.familyName)
                .keyboardType(.namePhonePad)
                .focused(self.$focusInputField, equals: .lastName)
            
            Picker("Gender", selection: self.$genderValue) {
                ForEach(ContactGender.allCases) { gender in
                    Text(gender.rawValue)
                }
            }
            .pickerStyle(.automatic)
            
            TextField("(Optional) company", text: self.$companyValue)
                .textContentType(.organizationName)
                .focused(self.$focusInputField, equals: .company)
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
                .focused(self.$focusInputField, equals: .phoneNumber)
            
            TextField("(Optional) Email", text: self.$emailValue)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .focused(self.$focusInputField, equals: .email)
        }
    }
    
    @ViewBuilder
    private func emergencySectionView() -> some View {
        Section {
            Toggle("Emergency Contact", isOn: self.$isEmergency)
            
            TextEditor(text: self.$notesValue)
                .focused(self.$focusInputField, equals: .emergencyNotes)
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
            
            self.focusInputField = nil
        }
    }
    
    private func onNextInputTapped() -> Void {
        guard let currentInput = self.focusInputField,
              let lastIndex = InputField.allCases.last?.rawValue
        else { return }
        
        let index = min(currentInput.rawValue + 1, lastIndex)
        self.focusInputField = .init(rawValue: index)
        
        if self.focusInputField?.rawValue == lastIndex {
            self.focusInputField = nil
        }
    }
    
    private func onPreviousInputTapped() -> Void {
        guard let currentInput = self.focusInputField,
              let firstIndex = InputField.allCases.first?.rawValue
        else { return }
        
        let index = max(currentInput.rawValue - 1, firstIndex)
        self.focusInputField = .init(rawValue: index)
        
        if self.focusInputField?.rawValue == firstIndex {
            self.focusInputField = nil
        }
    }
    
    private func onDoneTapped() -> Void {
        self.focusInputField = nil
    }
    
    private func onCancelTapped() -> Void {
        self.dismiss()
    }
    
    private func onSaveTapped() -> Void {
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

private extension AddContactView {
    enum InputField: Int, Hashable, CaseIterable {
        case title
        case firstName
        case lastName
        case company
        case phoneNumber
        case email
        case emergencyNotes
    }
}

