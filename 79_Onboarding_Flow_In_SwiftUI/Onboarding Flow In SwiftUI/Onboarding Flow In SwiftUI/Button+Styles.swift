//
//  Button+Styles.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct AppStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.horizontal, 60)
            .padding(.vertical, 15)
            .foregroundStyle(Color.accentColor)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
            )
            .opacity(configuration.isPressed ? 0.2 : 1.0)
    }
}

extension ButtonStyle where Self == AppStyle {
    static var appStyle: AppStyle {
        return AppStyle()
    }
}
