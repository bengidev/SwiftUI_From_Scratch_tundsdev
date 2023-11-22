//
//  GroupBox+SavedStyle.swift
//  GroupBox And GroupBoxStyle
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct GroupBoxSavedStyle: GroupBoxStyle {
    let font: Font
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            configuration.label.font(font)
            Divider().padding(.bottom, 5.0)
            configuration.content
        }
        .padding(16.0)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 8.0))
    }
}

extension GroupBoxStyle where Self == GroupBoxSavedStyle {
    static func saved(with font: Font = .headline) -> GroupBoxSavedStyle {
        return GroupBoxSavedStyle(font: font)
    }
}
