//
//  FirstAnimationView.swift
//  Animations In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct FirstAnimationView: View {
    @State private var isGreen: Bool = false
    @State private var isMinimized: Bool = false
    
    var body: some View {
        VStack {
            self.welcomeView()
            Divider()
            
            RoundedRectangle(cornerRadius: 12.0)
                .padding()
                .foregroundStyle(self.isGreen ? .red : .green)
                .shadow(radius: 5.0)
                .scaleEffect(self.isMinimized ? 0.3 : 1.0)
                .animation(.bouncy.delay(0.5).speed(0.25), value: self.isMinimized)
            
            self.turnButton() {
                withAnimation(.easeInOut) {
                    self.isGreen.toggle()
                }
            }
            
            self.minimizeButton() { self.isMinimized.toggle() }
        }
    }
}

#Preview {
    FirstAnimationView()
}

extension FirstAnimationView {
    private func welcomeView() -> some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, First Animation!")
        }
        .font(.headline)
    }
    
    private func turnButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(self.isGreen ? "Turn Green" : "Turn Red",
                      systemImage: self.isGreen ?
                      "wand.and.rays" :
                        "wand.and.rays.inverse",
                      action: action)
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    private func minimizeButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(self.isMinimized ? "Unminimize" : "Minimize",
                      systemImage: self.isMinimized ?
                      "textformat.size.larger" :
                      "textformat.size.smaller",
                      action: action)
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}
