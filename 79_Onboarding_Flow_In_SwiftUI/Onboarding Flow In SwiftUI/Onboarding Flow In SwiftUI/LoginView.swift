//
//  LoginView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var manager: SessionManager
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                self.infoView()
                self.usernameView()
                self.passwordView()
                self.loginButton {
                    self.manager.signIn()
                }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewLayout(.sizeThatFits)
            .environmentObject(SessionManager())
    }
}

private extension LoginView {
    @ViewBuilder
    private func infoView() -> some View {
        VStack(spacing: 8) {
            Text("🌎")
                .font(.system(size: 200))
            
            Text("Join the crew")
                .font(
                    .system(
                        size: 35,
                        weight: .heavy,
                        design: .rounded
                    )
                )
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                .font(
                    .system(
                        size: 18,
                        weight: .regular,
                        design: .rounded
                    )
                )
                .padding(.horizontal, 5)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .padding(.bottom, 50)
    }
    
    @ViewBuilder
    private func usernameView() -> some View {
        TextField("Username", text: .constant(""))
            .padding()
            .frame(width: 350, height: 50)
            .background(
                .white,
                in: RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
            )
            .font(.system(size: 13, weight: .bold, design: .rounded))
            .padding(.bottom, 8)
        
    }
    
    @ViewBuilder
    private func passwordView() -> some View {
        SecureField("Password", text: .constant(""))
            .padding()
            .frame(width: 350, height: 50)
            .background(
                .white,
                in: RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
            )
            .font(.system(size: 13, weight: .bold, design: .rounded))
    }
    
    @ViewBuilder
    private func loginButton(action: (@escaping () -> Void) = {}) -> some View {
        Button("Login") {
            action()
        }
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .padding(.horizontal, 60)
        .padding(.vertical, 15)
        .background(
            .white,
            in: RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
            )
        )
        .padding(.top, 40)
    }
}
