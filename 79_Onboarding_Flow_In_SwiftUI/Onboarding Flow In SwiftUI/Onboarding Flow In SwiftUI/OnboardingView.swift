//
//  OnboardingView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct OnboardingView: View {
    var continueAction: (() -> Void) = {}
    
    @StateObject private var manager = OnboardingManager()
    
    @State private var isShowingButton: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            if !self.manager.data.isEmpty {
                TabView {
                    self.tabContentView()
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            
            if self.isShowingButton {
                self.continueButton(action: self.continueAction)
            }
        }
        .onAppear(perform: self.manager.loadData)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewLayout(.sizeThatFits)
    }
}

private extension OnboardingView {
    @ViewBuilder
    private func tabContentView() -> some View {
        ForEach(self.manager.data) { item in
            OnboardingInfoView(item: item)
                .onAppear {
                    if item == self.manager.data.last {
                        withAnimation(.spring.delay(0.25)) {
                            self.isShowingButton = true
                        }
                    } else {
                        withAnimation(.spring.delay(0.25)) {
                            self.isShowingButton = false
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    private func continueButton(action: (@escaping () -> Void) = {}) -> some View {
        GeometryReader { geo in
            Button("Continue") {
                action()
            }
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .frame(width: 150, height: 50)
            .background(
                Color.white,
                in: RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
            )
            .position(
                x: geo.size.width / 2,
                y: geo.size.height / 1.2
            )
            .transition(.scale.combined(with: .opacity))
        }
    }
}

