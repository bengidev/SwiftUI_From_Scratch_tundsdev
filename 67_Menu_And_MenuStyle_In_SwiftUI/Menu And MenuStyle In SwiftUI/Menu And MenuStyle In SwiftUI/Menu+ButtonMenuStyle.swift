//
//  Menu+ButtonMenuStyle.swift
//  Menu And MenuStyle In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

struct MenuButtonStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .padding()
            .background(Material.ultraThin,
                        in: RoundedRectangle(cornerRadius: 15.0,
                                             style: .continuous))
            .padding()
    }
}

extension MenuStyle where Self == MenuButtonStyle {
    static var ultraThin: MenuButtonStyle { return MenuButtonStyle() }
}
