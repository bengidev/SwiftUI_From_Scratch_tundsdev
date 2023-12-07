//
//  NavigationManager.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import Foundation

@MainActor
final class NavigationManager: ObservableObject {
    @Published var screen: Screens? {
        didSet {
            print("📺 Screen: \(String(describing: screen))")
        }
    }
    
    func navigate(to screen: Screens) -> Void {
        self.screen = screen
    }
    
    func navigateToRoot() -> Void {
        self.screen = nil
    }
}
