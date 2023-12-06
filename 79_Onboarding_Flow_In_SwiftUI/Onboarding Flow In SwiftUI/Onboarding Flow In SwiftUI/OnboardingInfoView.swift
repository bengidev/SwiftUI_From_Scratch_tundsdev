//
//  OnboardingInfoView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct OnboardingInfoView: View {
    let item: OnboardingItem
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text(self.item.emoji)
                .font(.system(size: 150))
            
            Text(self.item.title)
                .font(.system(size: 35,
                              weight: .heavy,
                              design: .rounded))
                .padding(.bottom, 12)
            
            Text(self.item.content)
                .font(.system(size: 18,
                              weight: .light,
                              design: .rounded))
            
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .padding()
        .shadow(
            color: Color(
                red: 0,
                green: 0,
                blue: 0,
                opacity: 0.15),
            radius: 8,
            x: 6,
            y: 8
        )
        .scaleEffect(isAnimating ? 1.0 : 0.6)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .onDisappear {
            isAnimating = false
        }
    }
}

struct OnboardingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInfoView(item: .example)
            .previewLayout(.sizeThatFits)
            .background(.blue)
    }
}
