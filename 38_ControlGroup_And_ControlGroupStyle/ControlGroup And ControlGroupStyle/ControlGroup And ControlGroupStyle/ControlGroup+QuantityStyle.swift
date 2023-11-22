//
//  ControlGroup+QuantityStyle.swift
//  ControlGroup And ControlGroupStyle
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ControlGroupQuantityStyle: ControlGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            Label {
                Text("Quantity")
                    .font(.headline)
            } icon: {
                Image(systemName: "basket")
                    .imageScale(.large)
            }
            .padding(.bottom, 20)
            HStack { configuration.content.frame(maxWidth: .infinity) }
        }
    }
}

extension ControlGroupStyle where Self == ControlGroupQuantityStyle {
    static var quantity: ControlGroupQuantityStyle {
        return ControlGroupQuantityStyle()
    }
}
