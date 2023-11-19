//
//  LoginViewModel.swift
//  StateObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published private(set) var currentUser: User = .empty
    @Published var currentState: CurrentState = .logIn
    
    func login(with user: User) -> Void {
        guard !user.username.isEmpty && !user.password.isEmpty else { return }
        
        self.currentState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.currentState = .loggedIn
            self?.currentUser = user
            
            print("Login User Status: \(String(describing: self?.currentUser))")
        }
    }
    
    func logout() -> Void {
        self.currentState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.currentState = .logIn
            self?.currentUser = User.empty
            
            print("Logout User Status: \(String(describing: self?.currentUser))")
        }
    }
    
    enum CurrentState: CaseIterable {
        case loading
        case logIn
        case loggedIn
    }
}
