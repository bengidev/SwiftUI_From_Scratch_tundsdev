//
//  VStackView.swift
//  Stacks In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct VStackView: View {
    private let colors: [Color] = [
        .red, .orange, .yellow, .green, .blue, .purple,
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            ForEach(0..<self.colors.count, id: \.self) {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(self.colors[$0])
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    VStackView()
}
