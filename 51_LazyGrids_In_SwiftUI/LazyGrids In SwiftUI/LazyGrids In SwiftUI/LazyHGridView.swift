//
//  LazyVGridView.swift
//  LazyGrids In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct LazyHGridView: View {
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
    private let items = (0..<50).compactMap { "Item number: \($0)" }
    private let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, LazyHGrid!")
                Divider()
            }
            .padding(.vertical, 10.0)
            .font(.headline)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: self.rows) {
                    ForEach(self.items, id: \.self) { item in
                        self.itemButton(item)
                    }
                }
                .padding()
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    LazyHGridView()
}

extension LazyHGridView {
    private func itemButton(_ item: String,
                            action: (@escaping () -> Void) = {} ) -> some View {
        return Button(action: action) {
            Text(item)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.vertical, 40.0)
                .padding(.horizontal, 10.0)
                .frame(maxWidth: .infinity)
                .background(self.colors.randomElement()!,
                            in: RoundedRectangle(cornerRadius: 12.0))
            
                .shadow(radius: 5.0)
                .tag(item)
        }
    }
}
