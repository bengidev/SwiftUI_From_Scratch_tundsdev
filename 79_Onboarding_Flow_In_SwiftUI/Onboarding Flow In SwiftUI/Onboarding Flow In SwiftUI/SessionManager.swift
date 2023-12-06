//
//  SessionManager.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import Foundation

@MainActor
final class SessionManager: ObservableObject {
    @Published private(set) var currentState: SessionState = .onboarding
    
    func signIn() -> Void {
        self.currentState = .loggedIn
        
        UserDefaults.standard.setValue(
            true,
            forKey: UserDefaultsKeys.hasCompletedSignIn.rawValue
        )
    }
    
    func signOut() -> Void {
        self.currentState = .loggedOut
        
        UserDefaults.standard.setValue(
            false,
            forKey: UserDefaultsKeys.hasCompletedSignIn.rawValue
        )
    }
    
    func completeOnboarding() -> Void {
        self.currentState = .signup
        
        UserDefaults.standard.setValue(
            true,
            forKey: UserDefaultsKeys.hasCompletedOnboarding.rawValue
        )
    }
    
    func completeRegister() -> Void {
        self.currentState = .loggedIn
        
        UserDefaults.standard.setValue(
            true,
            forKey: UserDefaultsKeys.hasCompletedSignUp.rawValue
        )
    }
    
    func configureCurrentState() -> Void {
        /*
         - User closes the app during the onboarding phase > Resume the app from the onboarding screens
         - User closes the app during the sign up phase > Resume the app from the sign up screens
         - User closes the app after viewing onboarding and sign up phase > Resume the app from the log in screen
         */
        
        let hasCompletedOnboarding = UserDefaults.standard.value(
            forKey: UserDefaultsKeys.hasCompletedOnboarding.rawValue
        ) as? Bool ?? false
        
        let hasCompletedSignUp = UserDefaults.standard.value(
            forKey: UserDefaultsKeys.hasCompletedSignUp.rawValue
        ) as? Bool ?? false
        
        let hasCompletedSignIn = UserDefaults.standard.value(
            forKey: UserDefaultsKeys.hasCompletedSignIn.rawValue
        ) as? Bool ?? false
        
        if hasCompletedSignUp {
            currentState = hasCompletedSignIn ? .loggedIn : .loggedOut
        } else {
            currentState = hasCompletedOnboarding ? .signup : .onboarding
        }
    }
}

extension SessionManager {
    enum SessionState: Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case loggedIn
        case loggedOut
        case onboarding
        case signup
    }
}
