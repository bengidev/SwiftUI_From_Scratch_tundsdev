//
//  ContactInfoView.swift
//  Form In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import SwiftUI

struct ContactInfoView: View {
    let contact: Contact
    
    @State private var isShowNotes: Bool = false
    
    private var name: String {
        return self.contact.general.title + ". " +
        self.contact.general.firstName + " " +
        self.contact.general.lastName
    }
    
    private var gender: String {
        return self.contact.general.gender.rawValue
    }
    
    private var company: String {
        return self.contact.general.company
    }
    
    private var phone: String {
        return String(self.contact.contactInfo.phoneNumber)
    }
    
    private var email: String {
        return self.contact.contactInfo.email
    }
    
    private var isEmergency: Bool {
        return self.contact.emergency.isEmergency
    }
    
    private var notes: String {
        return self.contact.emergency.notes
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Group {
                self.nameView(self.name)
                self.genderView(self.gender)
                self.companyView(self.company)
            }
            
            Divider()
            
            Group {
                self.phoneView(self.phone)
                self.emailView(self.email)
            }
            
            if self.isEmergency {
                self.emergencyView()
            }
        }
        .padding()
        .background(Material.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 15.0))
        .padding()
        .animation(.easeInOut, value: self.isEmergency)
        .animation(.easeInOut, value: self.isShowNotes)
        .transition(.scale)
    }
}

#Preview {
    ContactInfoView(contact: .empty)
}

private extension ContactInfoView {
    @ViewBuilder
    private func nameView(_ name: String) -> some View {
        HStack(spacing: 0.0) {
            Text("Name: ")
                .font(.title3)
                .bold()
                .frame(maxWidth: 100.0, alignment: .leading)
            Text(name)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func genderView(_ gender: String) -> some View {
        HStack(spacing: 0.0) {
            Text("Gender: ")
                .bold()
                .frame(maxWidth: 100.0, alignment: .leading)
            Text(gender)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func companyView(_ company: String) -> some View {
        HStack(spacing: 0.0) {
            Text("Company: ")
                .bold()
                .frame(maxWidth: 100.0, alignment: .leading)
            Text(company)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func phoneView(_ phone: String) -> some View {
        HStack(spacing: 0.0) {
            Text("Phone: ")
                .bold()
                .frame(maxWidth: 100.0, alignment: .leading)
            Text(phone)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func emailView(_ email: String) -> some View {
        HStack(spacing: 0.0) {
            Text("Email: ")
                .bold()
                .frame(maxWidth: 100.0, alignment: .leading)
            Text(email)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func emergencyView() -> some View {
        VStack {
            Divider()
            
            HStack {
                Group {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.title3)
                    Text("Emergency Contact")
                        .font(.title3)
                        .bold()
                }
                .foregroundStyle(.red)
                
                Spacer()
                
                Button { self.isShowNotes.toggle() } label: {
                    Image(
                        systemName: self.isShowNotes ?
                        "chevron.up.circle.fill" :
                            "chevron.down.circle.fill"
                    )
                }
                .font(.title3)
                .foregroundStyle(.gray.opacity(0.5))
            }
            
            if self.isShowNotes {
                Text(self.notes)
                    .font(.headline)
                    .padding(.top, 5.0)
            }
        }
    }

}

