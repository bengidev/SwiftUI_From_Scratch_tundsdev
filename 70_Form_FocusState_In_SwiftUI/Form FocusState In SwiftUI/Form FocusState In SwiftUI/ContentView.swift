//
//  ContentView.swift
//  Form FocusState In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ContactViewModel
    
    @State private var shouldAddContact: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Group {
                        if self.vm.contacts.isEmpty {
                            self.emptyContactsView()
                        } else {
                            self.contactsView()
                        }
                    }
                }
            }
            .animation(.easeInOut, value: self.vm.contacts)
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        self.shouldAddContact.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: self.$shouldAddContact) {
                AddContactView { contact in
                    self.vm.addContact(contact)
                    
                    dump(contact)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ContactViewModel())
}

private extension ContentView {
    @ViewBuilder
    private func contactsView() -> some View {
        ForEach(self.vm.contacts) { contact in
            ContactInfoView(contact: contact)
        }
    }
    
    @ViewBuilder
    private func emptyContactsView() -> some View {
        Text("There are no contacts to show. Please ad your new contact first.")
            .font(.headline)
            .padding()
            .background(
                Material.ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 15.0)
            )
            .padding()
    }
}
