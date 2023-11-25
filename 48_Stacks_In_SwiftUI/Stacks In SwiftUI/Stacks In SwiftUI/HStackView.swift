//
//  HStackView.swift
//  Stacks In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct HStackView: View {
    private let colors: [Color] = [
        .red, .orange, .yellow, .green, .blue, .purple,
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<self.colors.count, id: \.self) {
                Circle()
                    .fill(self.colors[$0])
                    .frame(width: 50, height: 50)
            }
        }
    }
}

#Preview {
    HStackView()
}
