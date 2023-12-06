//
//  OnboardingItem.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import Foundation

struct OnboardingItem: Hashable, Identifiable {
    let id = UUID()
    let emoji: String
    let title: String
    let content: String
    
    static let example: OnboardingItem = .init(
        emoji: "🌬️",
        title: "Calm as wind",
        content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    )
}
