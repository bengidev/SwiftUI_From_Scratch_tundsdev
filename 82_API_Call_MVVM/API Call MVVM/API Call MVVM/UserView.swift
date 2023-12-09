//
//  UserView.swift
//  API Call MVVM
//
//  Created by Bambang Tri Rahmat Doni on 09/12/23.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        VStack {
            self.nameView()
            self.emailView()
            
            Divider()
            
            self.companyNameView()
            self.tagView()
            self.headlineView()
        }
        .padding()
        .background(Material.ultraThick)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
    }
}

struct UserView_Preview: PreviewProvider {
    static var previews: some View {
        UserView(user: .empty)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

private extension UserView {
    @ViewBuilder
    private func nameView() -> some View {
        HStack {
            Label(
                title: { Text("Name: ") },
                icon: { Image(systemName: "person.text.rectangle") }
            )
            .font(.title3.bold())
            .frame(maxWidth: 120.0, alignment: .leading)
            
            Text(self.user.name)
                .font(.title3.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private func emailView() -> some View {
        HStack {
            Label(
                title: { Text("Email: ") },
                icon: { Image(systemName: "person.crop.square.filled.and.at.rectangle") }
            )
            .font(.headline)
            .frame(maxWidth: 120.0, alignment: .leading)
            
            Text(self.user.email)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func companyNameView() -> some View {
        HStack {
            Label(
                title: { Text("Company Name: ") },
                icon: { Image(systemName: "house") }
            )
            .font(.headline)
            .frame(maxWidth: 140.0, alignment: .leading)
            
            Text(self.user.company.name)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private func tagView() -> some View {
        HStack {
            Label(
                title: { Text("Tag: ") },
                icon: { Image(systemName: "character.textbox") }
            )
            .font(.headline)
            .frame(maxWidth: 140.0, alignment: .leading)
            
            Text(self.user.company.tag)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func headlineView() -> some View {
        HStack {
            Label(
                title: { Text("Headline: ") },
                icon: { Image(systemName: "character.textbox") }
            )
            .font(.headline)
            .frame(maxWidth: 140.0, alignment: .leading)
            
            Text(self.user.company.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

