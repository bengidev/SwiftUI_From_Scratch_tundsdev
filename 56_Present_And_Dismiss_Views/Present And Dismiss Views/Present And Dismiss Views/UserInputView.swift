//
//  UserInputView.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct UserInputView: View {
    @State private var viewModel = UserInfoViewModel()
    @State private var showUserInfoSheet: UserInfo?
    @State private var showUserInfoFullScreen: UserInfo?
    @State private var showUserInfoPopOver: UserInfo?
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var gender: UserInfo.Gender = .preferNotToSay
    
    var body: some View {
        ZStack {
            Color.cyan
            
            VStack {
                self.titleView()
                self.firstNameView()
                self.lastNameView()
                self.genderView()
                self.saveSheetInfoView(action: self.saveUserInfoSheet)
                self.saveFullScreenInfoView(action: self.saveUserInfoFullScreen)
                self.savePopOverInfoView(action: self.saveUserInfoPopOver)
            }
            .padding()
            .background(Material.ultraThickMaterial,
                        in: RoundedRectangle(cornerRadius: 12.0))
            .padding(.horizontal, 10.0)
            .sheet(item: self.$showUserInfoSheet,
                   onDismiss: self.resetCurrentUserInfo) { _ in
                UserInfoView(user: self.$showUserInfoSheet)
            }
                   .fullScreenCover(item: self.$showUserInfoFullScreen,
                                    onDismiss: self.resetCurrentUserInfo) { _ in
                       UserInfoView(user: self.$showUserInfoFullScreen)
                   }
                                    .popover(item: self.$showUserInfoPopOver,
                                             attachmentAnchor: .point(.top),
                                             arrowEdge: .top) { _ in
                                        UserInfoView(user: self.$showUserInfoPopOver)
                                    }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    UserInputView()
}

private extension UserInputView {
    private func titleView() -> some View {
        return VStack {
            Text("Create New User")
                .font(.system(.title, design: .rounded))
                .bold()
            Divider()
        }
    }
    
    private func firstNameView() -> some View {
        return HStack {
            Label(
                title: { Text("First Name").font(.headline) },
                icon: { Image(systemName: "person.text.rectangle") }
            )
            TextField("", text: self.$firstName)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.vertical, 10.0)
        .onChange(of: self.firstName, perform: { value in
            self.viewModel.editUserInfo(firstName: value)
        })
    }
    
    private func lastNameView() -> some View {
        return HStack {
            Label(
                title: { Text("Last Name").font(.headline) },
                icon: { Image(systemName: "person.text.rectangle") }
            )
            TextField("", text: self.$lastName)
                .textFieldStyle(.roundedBorder)
        }
        .onChange(of: self.lastName, perform: { value in
            self.viewModel.editUserInfo(lastName: value)
        })
    }
    
    private func genderView() -> some View {
        return HStack {
            Label(
                title: { Text("Gender").font(.headline) },
                icon: { Image(systemName: "heart.text.square") }
            )
            Picker("", systemImage: "person.circle", selection: self.$gender) {
                ForEach(UserInfo.Gender.allCases, id: \.self) { gender in
                    Text(gender.rawValue)
                        .font(.headline)
                    
                }
            }
            .pickerStyle(.menu)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onChange(of: self.gender, perform: { value in
            self.viewModel.editUserInfo(gender: value)
        })
    }
    
    private func saveSheetInfoView(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Save Sheet Info", systemImage: "checkmark", action: action)
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding(.top, 30.0)
    }
    
    private func saveFullScreenInfoView(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Save Full Screen Info", systemImage: "checkmark", action: action)
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding(.top, 10.0)
    }
    
    private func savePopOverInfoView(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Save Pop Over Info", systemImage: "checkmark", action: action)
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding(.top, 10.0)
    }
}

private extension UserInputView {
    private func saveUserInfoSheet() -> Void {
        withAnimation {
            self.showUserInfoSheet = self.viewModel.currentUser
        }
    }
    
    private func saveUserInfoFullScreen() -> Void {
        withAnimation {
            self.showUserInfoFullScreen = self.viewModel.currentUser
        }
    }
    
    private func saveUserInfoPopOver() -> Void {
        withAnimation {
            self.showUserInfoPopOver = self.viewModel.currentUser
        }
    }
    
    private func resetCurrentUserInfo() -> Void {
        withAnimation {
            self.firstName = ""
            self.lastName = ""
            self.gender = .preferNotToSay
        }
    }
    
}

