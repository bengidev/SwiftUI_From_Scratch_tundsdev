//
//  LoggedInView.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct LoggedInView: View {
    @ObservedObject var loginVM: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Hey \(self.loginVM.currentUser.username), you're now logged in.")
                .font(.system(size: 20, weight: .bold))
            
            Button(action: self.loginVM.logout, label: {
                Text("Logout")
                    .font(.system(size: 20, weight: .bold))
            })
            .padding(.top, 30)
        }
    }
}

#Preview {
    LoggedInView(loginVM: LoginViewModel())
}
