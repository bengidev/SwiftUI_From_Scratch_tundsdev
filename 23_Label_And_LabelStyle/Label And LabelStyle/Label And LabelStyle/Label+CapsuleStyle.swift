//
//  Label+CapsuleStyle.swift
//  Label And LabelStyle
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct CapsuleStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct StrongCapsuleStyle: LabelStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
                .foregroundStyle(.white)
                .font(.system(size: 15.0, weight: .bold))
        } icon: {
            configuration.icon
        }
        .padding()
        .background(color)
        .clipShape(Capsule())
    }
}

extension LabelStyle where Self == CapsuleStyle {
    static var capsule: CapsuleStyle { return CapsuleStyle() }
}

extension LabelStyle where Self == StrongCapsuleStyle {
    static func strongCapsule(with color: Color) -> StrongCapsuleStyle {
        return StrongCapsuleStyle(color: color)
    }
}
