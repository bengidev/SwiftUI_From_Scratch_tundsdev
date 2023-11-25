//
//  ZStackView.swift
//  Stacks In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct ZStackView: View {
    private let colors: [Color] = [
        .red, .orange, .yellow, .green, .blue, .purple,
    ]
    
    var body: some View {
        ZStack {
            ForEach(0..<self.colors.count, id: \.self) {
                Rectangle()
                    .fill(self.colors[$0])
                    .frame(width: 100, height: 100)
                    .offset(x: CGFloat(Double($0) * 10.0),
                            y: CGFloat(Double($0) * 10.0))
            }
        }
        .padding()
    }
}

#Preview {
    ZStackView()
}
