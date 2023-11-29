//
//  PopupView.swift
//  Custom PopUp In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

struct PopupView: View {
    @ObservedObject var vm: SheetViewModel
    
    let config: SheetViewModel.Config
    let didTapCloseButton: (() -> Void)?
    
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 20) {
            self.iconImage()
            self.titleText()
            self.contentText()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40.0)
        .padding(.horizontal, 24.0)
        .multilineTextAlignment(.leading)
        .background(RoundedCornerView(material: .thinMaterial, tl: 25.0, tr: 25.0))
        .shadow(radius: 5.0)
        .overlay(alignment: .topTrailing) {
            self.closeButton { self.didTapCloseButton?() }
        }
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    PopupView(vm: SheetViewModel(), config: .empty) { }
}

private extension PopupView {
    @ViewBuilder
    private func closeButton(action: (@escaping () -> Void) = {}) -> some View {
        Button {
            withAnimation { action() }
        } label: {
            Image(systemName: "xmark.circle.fill")
                .tint(.gray)
                .font(.title)
                .symbolRenderingMode(.hierarchical)
        }
        .padding([.top, .trailing])
    }
    
    
    @ViewBuilder
    private func iconImage() -> some View {
        let gradient1: [UIColor] = [.blue, .green]
        let gradient2: [UIColor] = [.red, .yellow]
        let animation = Animation.easeInOut.delay(0.5).repeatForever()
        let modifier = AnimatableGradient(from: gradient1,
                                          to: gradient2,
                                          pct: self.animate ? 1 : 0)
        
        Image(systemName: self.config.systemName)
            .frame(width: 70.0, height: 70.0)
            .font(.system(size: 35.0, weight: .bold, design: .rounded))
            .foregroundStyle(.thinMaterial)
            .background(Color.clear
                .modifier(modifier))
            .animation(animation, value: self.animate)
            .onAppear {
                self.animate.toggle()
            }
    }
    
    @ViewBuilder
    private func titleText() -> some View {
        Text(self.config.title)
            .font(.system(size: 30.0, weight: .bold, design: .rounded))
    }
    
    @ViewBuilder
    private func contentText() -> some View {
        Text(self.config.content)
            .font(.callout)
            .foregroundStyle(.black.opacity(0.7))
    }
}

