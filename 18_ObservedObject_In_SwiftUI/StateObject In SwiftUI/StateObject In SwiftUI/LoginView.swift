//
//  LoginView.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM: LoginViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    private var errorMessage: String {
        var message = ""
        if self.username.isEmpty && self.password.isEmpty {
            message = "Your username and password was empty!"
        } else if self.username.isEmpty {
            message = "Your username was empty!"
        } else if self.password.isEmpty {
            message = "Your password was empty!"
        }
        return message
    }
    
    var body: some View {
        VStack {
            TextField("Username",
                      text: self.$username,
                      prompt: Text("Username"))
            
            SecureField("Password",
                        text: self.$password,
                        prompt: Text("Password"))
            
            Button {
                let user = User(username: self.username, password: self.password)
                self.loginVM.login(with: user)
                
                print("Login Error: \(self.errorMessage)")
            } label: {
                Text("Login")
                    .font(.system(size: 20, weight: .bold))
            }
            .padding(.top, 50)
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    LoginView(loginVM: LoginViewModel())
}
