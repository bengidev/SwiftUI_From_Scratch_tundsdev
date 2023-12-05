//
//  ContentView.swift
//  Simple Model View ViewModel
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        VStack {
            self.helloView()
            self.numberView()
            self.incrementButton {
                self.vm.increment(by: 1)
            }
        }
        .animation(.easeInOut, value: self.vm.data)
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}

private extension ContentView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    private func numberView() -> some View {
        VStack(spacing: 20.0) {
            Text(self.vm.data.number.description)
                .font(
                    .system(
                        size: 80.0,
                        weight: .bold,
                        design: .rounded
                    )
                )
                .bold()
            Text("Current Number")
        }
        .frame(width: 200.0, height: 200.0)
        .background(Color.mint)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    private func incrementButton(action: (@escaping () -> Void) = {}) -> some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Label(
                title: { Text("Increment") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
        }
        .font(.headline)
        .buttonStyle(.bordered)
        .tint(.teal)
    }
}
