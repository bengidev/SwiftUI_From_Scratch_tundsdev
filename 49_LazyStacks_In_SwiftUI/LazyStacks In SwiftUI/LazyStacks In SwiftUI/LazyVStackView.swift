//
//  LazyVStackView.swift
//  LazyStacks In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct LazyVStackView: View {
    @State private var multiSelection = Set<UUID>()
    
    private var colors: [Color] = [
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
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 30) {
                ForEach(0...100_000, id: \.self) { _ in
                    Rectangle()
                        .fill(self.colors.randomElement()!)
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LazyVStackView()
}
