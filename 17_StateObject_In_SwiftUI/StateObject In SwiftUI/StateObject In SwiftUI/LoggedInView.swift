//
//  LoggedInView.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct LoggedInView: View {
    var didTapLogoutButton: (() -> Void)
    
    var body: some View {
        VStack {
            Text("Hey, you're now logged in.")
                .font(.system(size: 20, weight: .bold))
            
            Button(action: self.didTapLogoutButton, label: {
                Text("Logout")
                    .font(.system(size: 20, weight: .bold))
            })
            .padding(.top, 30)
        }
    }
}

#Preview {
    LoggedInView { }
}
