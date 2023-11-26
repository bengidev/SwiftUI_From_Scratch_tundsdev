//
//  TransitionView.swift
//  Transitions In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct TransitionView: View {
    let title: String
    let transition: AnyTransition
    
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack {
            self.descriptionView()
            Divider()
                .padding(.bottom, 20.0)
            
            if self.isVisible {
                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.red)
                    .shadow(radius: 5.0)
                    .padding(.bottom, 20.0)
                    .transition(self.transition)
            }
            
            self.toggleButton() {
                withAnimation {
                    self.isVisible.toggle()
                }
            }
        }
        .frame(height: 300.0)
        .background(.gray.opacity(0.1),
                    in: RoundedRectangle(cornerRadius: 12.0, style: .circular))
    }
}

#Preview {
    TransitionView(title: "Empty", transition: .opacity)
}

extension TransitionView {
    private func descriptionView() -> some View {
        return Text("Hello, \(self.title)")
            .font(.headline)
    }
    
    private func toggleButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(self.isVisible ? "Hide Box" : "Show Box",
                      systemImage: self.isVisible ?
                      "wand.and.stars.inverse" :
                        "wand.and.stars",
                      action: action)
        .font(.headline)
        .controlSize(.regular)
        .buttonStyle(.borderedProminent)
    }
    
}
