//
//  ContentView.swift
//  Communicate Views With Closures
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    @State private var isColorChanged: Bool = false
    @State private var isScaleChanged: Bool = false
    
    var body: some View {
        VStack {
            self.helloView()
            
            if self.isActive {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(self.isColorChanged ? .red : .gray)
                    .frame(
                        width: self.isScaleChanged ? 200.0 : 100.0,
                        height: self.isScaleChanged ? 200.0 : 100.0
                    )
                    .shadow(radius: 5.0)
                    .transition(.scale)
            }
            
            SecondView {
                withAnimation {
                    self.isActive.toggle()
                }
            } defaultAction: { action in
                switch action {
                case .color:
                    withAnimation(.easeInOut) {
                        self.isColorChanged.toggle()
                    }
                case .scale:
                    withAnimation(.bouncy) {
                        self.isScaleChanged.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Content View!")
        }
        .font(.headline)
        .padding()
        .background(
            Material.ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 15.0)
        )
        .padding()
    }
}

