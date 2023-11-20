//
//  Toggle+CheckBoxStyle.swift
//  Build CheckBox
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ToggleCheckBoxStyle: ToggleStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill : .none)
        }
        .tint(color)
    }
}

extension ToggleStyle where Self == ToggleCheckBoxStyle {
    static func checkbox(color: Color = .accentColor) -> ToggleCheckBoxStyle {
        return ToggleCheckBoxStyle(color: color)
    }
}
