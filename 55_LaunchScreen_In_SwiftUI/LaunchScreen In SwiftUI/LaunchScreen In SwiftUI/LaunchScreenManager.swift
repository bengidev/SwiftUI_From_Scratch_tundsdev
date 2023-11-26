//
//  LaunchScreenManager.swift
//  LaunchScreen In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import Foundation

enum LaunchScreenPhase {
    case first
    case second
    case completed
}

final class LaunchScreenManager: ObservableObject {
    @Published private(set) var state: LaunchScreenPhase = .first
    
    func dismiss() -> Void {
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.state = .completed
        }
    }
}
