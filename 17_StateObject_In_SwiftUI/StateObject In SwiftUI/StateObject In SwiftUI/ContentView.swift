//
//  ContentView.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        switch self.loginVM.currentState {
        case .loading:
            ProgressView {
                Text("Loading")
                    .font(.system(size: 20, weight: .bold))
            }
            .padding(.bottom, 30)
        case .logIn:
            LoginView(user: self.$loginVM.currentUser) {
                self.loginVM.login(with: self.loginVM.currentUser)
            }
        case .loggedIn:
            LoggedInView(didTapLogoutButton: self.loginVM.logout)
        }
    }
}

#Preview {
    ContentView()
}
