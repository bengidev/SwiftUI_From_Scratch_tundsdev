//
//  Button+SendStyle.swift
//  Button In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct SendButtonStyle: ButtonStyle {
    let foregroundColor: Color
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "paperplane")
                .symbolVariant(.fill)
            configuration.label
        }
        .frame(minWidth: 150, minHeight: 44)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .opacity(configuration.isPressed ? 0.2 : 1.0)
    }
}

extension ButtonStyle where Self == SendButtonStyle {
    static func send(foregroundColor: Color = .white, backgroundColor: Color = .accentColor) -> SendButtonStyle {
        return SendButtonStyle(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
}
