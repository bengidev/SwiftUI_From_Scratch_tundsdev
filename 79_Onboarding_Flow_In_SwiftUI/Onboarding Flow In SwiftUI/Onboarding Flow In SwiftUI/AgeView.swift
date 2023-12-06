//
//  AgeView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct AgeView: View {
    @Binding var age: Double
    
    var nextAction: (() -> Void) = {}
    
    var body: some View {
        VStack {
            self.ageLogoView()
            self.ageContentView()
            self.ageYearSlider()
            self.nextButton(action: self.nextAction)
        }
    }
}

struct AgeView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView(age: .constant(0.0))
            .padding()
            .previewLayout(.sizeThatFits)
            .background(.blue)
    }
}

private extension AgeView {
    @ViewBuilder
    private func ageLogoView() -> some View {
        Text("👶")
            .font(.system(size: 100))
    }
    
    @ViewBuilder
    private func ageContentView() -> some View {
        Text("Age")
            .font(.system(size: 30,
                          weight: .bold,
                          design: .rounded))
            .foregroundColor(.white)
    }

    @ViewBuilder
    private func ageYearSlider() -> some View {
        VStack(spacing: 0) {
            Text("\(Int(self.age)) year")
                .font(.system(size: 20,
                              weight: .regular,
                              design: .rounded))
                .foregroundColor(.white)
            
            Slider(value: self.$age, in: 18...100, step: 1)
                .padding()
                .tint(.white)
        }
    }

    @ViewBuilder
    private func nextButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Text("Next")
        }
        .buttonStyle(.appStyle)
    }
}

