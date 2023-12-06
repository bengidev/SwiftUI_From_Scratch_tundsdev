//
//  MainAppView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct MainAppView: View {
    @StateObject private var manager = SessionManager()
    
    var body: some View {
        ZStack {
            switch self.manager.currentState {
            case .loggedIn:
                // Add same color from specified View for transition
                Color.mint
                    .ignoresSafeArea()
                HomeView()
                    .transition(.slide.combined(with: .opacity))
            case .loggedOut:
                LoginView()
                    .transition(.opacity)
            case .onboarding:
                // Add same color from specified View for transition
                Color.orange
                    .ignoresSafeArea()
                OnboardingView {
                    self.manager.completeOnboarding()
                }
                .transition(.slide.combined(with: .opacity))
            case .signup:
                // Add same color from specified View for transition
                Color.teal
                    .ignoresSafeArea()
                SignUpView()
                    .transition(.slide.combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: self.manager.currentState)
        .environmentObject(self.manager)
        .onAppear {
            self.manager.configureCurrentState()
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
            .previewLayout(.sizeThatFits)
    }
}

