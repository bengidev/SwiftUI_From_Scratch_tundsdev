//
//  UserDetailView.swift
//  Refactor Codebase MVVM
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                self.infoView()
                Divider()
                
                self.contactView()
                Divider()
                
                self.companyView()
                Divider()
                
                self.addressView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.gray.opacity(0.1), 
                        in: RoundedRectangle(
                            cornerRadius: 10.0,
                            style: .continuous
                        )
            )
            .padding()
            .navigationTitle(self.user.name)
            
        }
    }
}

#Preview {
    UserDetailView(user: .empty)
}

private extension UserDetailView {
    @ViewBuilder
    private func infoView() -> some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text("Info")
                .bold()
            Text(self.user.name)
            Text(self.user.username)
        }
    }
    
    @ViewBuilder
    private func contactView() -> some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text("Contact")
                .bold()
            Text(self.user.website)
            Text(self.user.phone)
            Text(self.user.email)
        }
    }

    @ViewBuilder
    private func companyView() -> some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text("Company")
                .bold()
            Text(self.user.company.name)
        }
    }

    @ViewBuilder
    private func addressView() -> some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text("Address")
                .bold()
            Text(self.self.user.address.street)
            Text(self.user.address.suite)
            Text(self.user.address.city)
            Text(self.user.address.zipcode)
            
        }
    }
}

