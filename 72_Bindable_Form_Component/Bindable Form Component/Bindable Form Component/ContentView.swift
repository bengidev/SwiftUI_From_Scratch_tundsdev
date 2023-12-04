//
//  ContentView.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var accountManager = FormManagerImpl()
    @StateObject private var loginManager = LoginFormManagerImpl()
    
    @State private var isShowedForm: Bool = false
    @State private var formData: [FormSection] = []
    
    var body: some View {
        VStack {
            self.helloView()
            
            if !self.formData.isEmpty {
                self.completeFormView(self.formData)
            }
            
            self.showFormButton(action: self.onTapShowForm)
        }
        .sheet(isPresented: self.$isShowedForm) {
            FormView(manager: self.accountManager, title: "Account Details")  { data in
                withAnimation {
                    self.isShowedForm.toggle()
                    self.formData = data
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .font(.headline)
        .padding()
        .background(
            Material.ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 15.0)
        )
    }
    
    @ViewBuilder
    private func showFormButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(
            "Show Form",
            systemImage: "rectangle.and.hand.point.up.left.fill",
            action: action
        )
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
        .padding(.vertical, 20.0)
    }
    
    @ViewBuilder
    private func completeFormView(_ data: [FormSection]) -> some View {
        VStack {
            ForEach(data) { data in
                ForEach(data.items) { item in
                    self.formTitleView(data: data, item: item)
                    self.formFirstNameView(data: data, item: item)
                    self.formLastNameView(data: data, item: item)
                    self.formUsernameView(data: data, item: item)
                    self.formPasswordView(data: data, item: item)
                }
            }
        }
        .padding()
        .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 15.0))
        .padding()
    }

    @ViewBuilder
    private func formTitleView(data: FormSection, item: FormItem) -> some View {
        if data.key == .general && item.key == .title {
            HStack(spacing: 0.0) {
                Text("Title: ")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: 100.0, alignment: .leading)
                Text(item.stringValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5.0)
        }
    }
    
    @ViewBuilder
    private func formFirstNameView(data: FormSection, item: FormItem) -> some View {
        if data.key == .general && item.key == .firstName {
            HStack(spacing: 0.0) {
                Text("First Name: ")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: 100.0, alignment: .leading)
                Text(item.stringValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5.0)
        }
    }
    
    @ViewBuilder
    private func formLastNameView(data: FormSection, item: FormItem) -> some View {
        if data.key == .general && item.key == .lastName {
            HStack(spacing: 0.0) {
                Text("Last Name: ")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: 100.0, alignment: .leading)
                Text(item.stringValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5.0)
        }
    }
    
    @ViewBuilder
    private func formUsernameView(data: FormSection, item: FormItem) -> some View {
        if data.key == .login && item.key == .username {
            HStack(spacing: 0.0) {
                Text("Username: ")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: 100.0, alignment: .leading)
                Text(item.stringValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5.0)
        }
    }
    
    @ViewBuilder
    private func formPasswordView(data: FormSection, item: FormItem) -> some View {
        if data.key == .login && item.key == .password {
            HStack(spacing: 0.0) {
                Text("Password: ")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: 100.0, alignment: .leading)
                Text(item.stringValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5.0)
        }
    }
}

private extension ContentView {
    private func onTapShowForm() -> Void {
        withAnimation {
            self.isShowedForm.toggle()
        }
    }
}
