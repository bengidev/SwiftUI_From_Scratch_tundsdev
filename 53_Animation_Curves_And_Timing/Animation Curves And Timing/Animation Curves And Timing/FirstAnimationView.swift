//
//  FirstAnimationView.swift
//  Animation Curves And Timing
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct FirstAnimationView: View {
    let animationConfig: AnimationConfig
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            self.welcomeView()
            Divider()
            
            Image(systemName: "arrow.triangle.2.circlepath.circle")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 100.0))
                .shadow(radius: 5.0)
                .rotationEffect(.degrees(self.isAnimated ? 360.0 : 0.0))
                .animation(self.isAnimated ?
                           self.customAnimation :
                            Animation.default,
                           value: self.isAnimated)
            
            self.animateButton() { self.isAnimated.toggle() }
        }
    }
    
}

#Preview {
    FirstAnimationView(animationConfig: .standard)
}

extension FirstAnimationView {
    private var customAnimation: Animation {
        return self.animationConfig
            .animation
            .repeatForever(autoreverses: false)
    }
    
    private func welcomeView() -> some View {
        return Text("\(self.animationConfig.description) Animation")
            .font(.headline)
    }
    
    private func animateButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(self.isAnimated ? "Reanimate" : "Animate",
                      systemImage: self.isAnimated ?
                      "wand.and.rays" :
                        "wand.and.rays.inverse",
                      action: action)
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
    }
}
