//
//  UserDefaults+Keys.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import Foundation

enum UserDefaultsKeys: String, Hashable, Identifiable, CaseIterable {
    var id: Self { return self }
    case hasCompletedOnboarding = "hasCompletedOnboarding"
    case hasCompletedSignUp = "hasCompletedSignUp"
    case hasCompletedSignIn = "hasCompletedSignIn"
}
