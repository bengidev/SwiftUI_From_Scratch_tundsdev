//
//  SendButton.swift
//  Button In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct SendButton: View {
    let foregroundColor: Color
    let backgroundColor: Color
    let action: (() -> Void)
    
    init(foregroundColor: Color = .white,
         backgroundColor: Color = .accentColor,
         action: @escaping () -> Void) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            Text("Send Button")
        }
        .buttonStyle(.send(foregroundColor: foregroundColor,
                           backgroundColor: backgroundColor))
    }
}

#Preview {
    SendButton { }
}
