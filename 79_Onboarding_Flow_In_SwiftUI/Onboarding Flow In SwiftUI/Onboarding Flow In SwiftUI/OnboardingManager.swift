//
//  OnboardingManager.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import Foundation

@MainActor
final class OnboardingManager: ObservableObject {
    @Published private(set) var data: [OnboardingItem] = []
    
    func loadData() -> Void {
        self.data = [
            .init(emoji: "🤝",
                  title: "Join the crew",
                  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            .init(emoji: "❤️",
                  title: "Support the crew",
                  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            .init(emoji: "🥳",
                  title: "Celebrate the crew",
                  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        ]
    }
}
