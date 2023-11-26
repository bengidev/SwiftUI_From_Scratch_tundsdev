//
//  LazyVGridView.swift
//  LazyGrids In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct MultiLayoutGridView: View {
    @State private var isMultiColumn: Bool = false
    
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
    private var columns: [GridItem] {
        return Array(repeating: GridItem(.flexible()),
                     count: self.isMultiColumn ? 2 : 1)
    }
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, MultiLayoutGrid!")
                Divider()
                self.toggleButton() {
                    withAnimation {
                        self.isMultiColumn.toggle()
                    }
                }
                .frame(maxWidth: .infinity,
                       alignment: .trailing)
                .padding(.horizontal, 20.0)
            }
            .padding(.vertical, 10.0)
            .font(.headline)
            
            ScrollView {
                
                LazyVGrid(columns: self.columns) {
                    ForEach(self.items, id: \.self) { item in
                        self.itemButton(item)
                            .padding(.vertical, 5.0)
                    }
                }
                .padding()
                .animation(.spring, value: self.isMultiColumn)
            }
        }
    }
}

#Preview {
    MultiLayoutGridView()
}

extension MultiLayoutGridView {
    private func toggleButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Toggle",
                      systemImage: self.isMultiColumn ?
                      "rectangle.grid.1x2.fill" :
                        "rectangle.grid.2x2.fill",
                      action: action)
    }
    
    
    private func itemButton(_ item: String,
                            action: (@escaping () -> Void) = {} ) -> some View {
        return Button(action: action) {
            Text(item)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(self.colors.randomElement()!,
                            in: RoundedRectangle(cornerRadius: 12.0))
            
                .shadow(radius: 5.0)
                .tag(item)
        }
    }
}
