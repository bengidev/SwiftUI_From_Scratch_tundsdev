//
//  Button+AppStyle.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct ButtonAppStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .foregroundStyle(Color.accentColor)
            .background(Material.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

extension ButtonStyle where Self == ButtonAppStyle {
    static var appStyle: ButtonAppStyle { return .init() }
}
