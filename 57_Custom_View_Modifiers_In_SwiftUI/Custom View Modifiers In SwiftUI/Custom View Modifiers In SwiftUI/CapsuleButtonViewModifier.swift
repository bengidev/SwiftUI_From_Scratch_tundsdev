//
//  CapsuleButtonViewModifier.swift
//  Custom View Modifiers In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct CapsuleButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18.0, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 10.0)
            .padding(.horizontal, 25.0)
            .background(Material.ultraThinMaterial)
            .clipShape(Capsule())
            .padding(.top, 50.0)
    }
}

extension View {
    func applyCapsuleButtonStyle() -> some View {
        self.modifier(CapsuleButtonViewModifier())
    }
}
