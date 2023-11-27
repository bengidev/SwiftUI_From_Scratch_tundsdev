//
//  UserInfoView.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var user: UserInfo?
    
    var body: some View {
        ZStack {
            Color.mint
            
            VStack {
                self.titleView()
                self.firstNameView()
                self.lastNameView()
                self.genderView()
                self.resetInfoView() {
                    withAnimation {
                        self.user = nil
                    }
                }
            }
            .padding()
            .background(Material.ultraThickMaterial,
                        in: RoundedRectangle(cornerRadius: 12.0))
            .padding(.horizontal, 10.0)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    UserInfoView(user: .constant(UserInfo.empty))
}

private extension UserInfoView {
    private func titleView() -> some View {
        return VStack {
            Text("User Info Detail")
                .font(.system(.title, design: .rounded))
                .bold()
            Divider()
        }
    }
    
    private func firstNameView() -> some View {
        return HStack {
            Label(
                title: { Text("First Name: ").font(.headline) },
                icon: { Image(systemName: "person.text.rectangle") }
            )
            Text(self.user?.firstName ?? "Empty")
                .font(.headline)
        }
        .padding(.vertical, 10.0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func lastNameView() -> some View {
        return HStack {
            Label(
                title: { Text("Last Name: ").font(.headline) },
                icon: { Image(systemName: "person.text.rectangle") }
            )
            Text(self.user?.lastName ?? "Empty")
                .font(.headline)
        }
        .padding(.vertical, 10.0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func genderView() -> some View {
        return HStack {
            Label(
                title: { Text("Gender: ").font(.headline) },
                icon: { Image(systemName: "heart.text.square") }
            )
            Text(self.user?.gender.rawValue ?? "Empty")
                .font(.headline)
        }
        .padding(.vertical, 10.0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func resetInfoView(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Reset Current Info", systemImage: "pencil.slash", action: action)
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding(.top, 20.0)
    }
}

