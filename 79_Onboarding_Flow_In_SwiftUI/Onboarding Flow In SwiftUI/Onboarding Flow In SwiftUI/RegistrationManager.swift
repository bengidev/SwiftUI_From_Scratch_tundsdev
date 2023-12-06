//
//  RegistrationManager.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import Foundation

@MainActor
final class RegistrationManager: ObservableObject {
    @Published var currentUser: User = .empty
    @Published var screenActive: Screen = .username
    @Published var hasError = false
    @Published var error: RegistrationError?
    
    func nextScreen() -> Void {
        let nextIndex = min(self.screenActive.rawValue + 1, Screen.allCases.last?.rawValue ?? 0)
        if let screen = Screen(rawValue: nextIndex) {
            self.screenActive = screen
        }
    }
    
    func previousScreen() -> Void {
        let previousIndex = max(self.screenActive.rawValue - 1, Screen.allCases.first?.rawValue ?? 0)
        if let screen = Screen(rawValue: previousIndex) {
            self.screenActive = screen
        }
    }
    
    func hasValidUsername() -> Bool {
        self.hasError = self.currentUser.username.isEmpty
        self.error = self.currentUser.username.isEmpty ? .emptyUsername : nil
        
        return !self.hasError
    }
    
    func hasValidBio() -> Bool {
        self.hasError = self.currentUser.bio.isEmpty
        self.error = self.currentUser.bio.isEmpty ? .emptyBio : nil
        
        return !self.hasError
    }
}

extension RegistrationManager {
    struct User: Hashable, Identifiable {
        let id = UUID()
        var username: String
        var age: Double
        var bio: String
        
        static let empty: User = .init(username: "", age: 18, bio: "")
    }
}

extension RegistrationManager {
    enum Screen: Int, Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case username
        case age
        case bio
    }
}

extension RegistrationManager {
    enum RegistrationError: LocalizedError {
        case emptyUsername
        case emptyBio
        
        var errorDescription: String? {
            switch self {
            case .emptyUsername:
                return "⚠️ Username is empty"
            case .emptyBio:
                return "⚠️ Bio is empty"
            }
        }
    }
}
