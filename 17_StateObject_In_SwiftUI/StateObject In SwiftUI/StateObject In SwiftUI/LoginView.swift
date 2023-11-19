//
//  LoginView.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var user: User
    var didTapLoginButton: (() -> Void)
    
    var body: some View {
        VStack {
            TextField("Username", 
                      text: self.$user.username,
                      prompt: Text("Username"))
            
            SecureField("Password",
                        text: self.$user.password,
                        prompt: Text("Password"))
            
            Button(action: self.didTapLoginButton , label: {
                Text("Login")
                    .font(.system(size: 20, weight: .bold))
            })
            .padding(.top, 50)
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    LoginView(user: .constant(User.empty), didTapLoginButton: {})
}
