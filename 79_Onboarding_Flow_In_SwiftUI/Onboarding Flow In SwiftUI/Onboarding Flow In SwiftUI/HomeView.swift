//
//  HomeView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: SessionManager
    
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                self.contentView()
                self.signOutButton {
                    self.manager.signOut()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.sizeThatFits)
            .environmentObject(SessionManager())
    }
}

private extension HomeView {
    @ViewBuilder
    private func contentView() -> some View {
        Text("[Home Content Here]")
            .font(
                .system(
                    size: 20,
                    weight: .heavy,
                    design: .rounded
                )
            )
            .padding(.bottom, 30)
    }
    
    @ViewBuilder
    private func signOutButton(action: (@escaping () -> Void) = {}) -> some View {
        Button("Sign Out") {
            action()
        }
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .padding(.horizontal, 40)
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

