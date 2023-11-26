//
//  SecondAnimationView.swift
//  Animations In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct SecondAnimationView: View {
    @State private var isRotated: Bool = false
    
    var body: some View {
        VStack {
            self.welcomeView()
            Divider()
            
            Image(systemName: "arrow.triangle.2.circlepath.circle")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 150.0))
                .shadow(radius: 5.0)
                .rotationEffect(.degrees(self.isRotated ? 360.0 : 0.0))
                .animation(self.isRotated ?
                           self.rotationAnimation :
                            Animation.default,
                           value: self.isRotated)
            
            self.rotateButton() { self.isRotated.toggle() }
        }
    }
    
}

#Preview {
    SecondAnimationView()
}

extension SecondAnimationView {
    private var rotationAnimation: Animation {
        return Animation.linear(duration: 1.0)
            .repeatForever(autoreverses: false)
    }
    
    private func welcomeView() -> some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Second Animation!")
        }
        .font(.headline)
    }
    
    private func rotateButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(self.isRotated ? "Unrotate" : "Rotate",
                      systemImage: self.isRotated ?
                      "wand.and.rays" :
                        "wand.and.rays.inverse",
                      action: action)
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}
