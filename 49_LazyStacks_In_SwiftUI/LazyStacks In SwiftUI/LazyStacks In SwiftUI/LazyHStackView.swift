//
//  LazyHStackView.swift
//  LazyStacks In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct LazyHStackView: View {
    private let colors: [Color] = [
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .pink,
        .brown,
        .gray,
        .black,
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 30) {
                ForEach(0...100_000, id: \.self) { _ in
                    Rectangle()
                        .fill(self.colors.randomElement()!)
                        .frame(width: 100, height: 100)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LazyHStackView()
}
