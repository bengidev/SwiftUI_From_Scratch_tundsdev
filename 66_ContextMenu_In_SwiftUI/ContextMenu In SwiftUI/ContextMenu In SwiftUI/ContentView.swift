//
//  ContentView.swift
//  ContextMenu In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            self.helloView()
                .contextMenu {
                    self.menuItemsView()
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
            Text("Hello, Context Menu!")
        }
        .font(.headline)
        .padding()
        .background(Material.regular,
                    in: RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 3.0)
    }

    @ViewBuilder
    private func menuItemsView() -> some View {
        Button { 
            print("First Button was tapped!")
        } label: {
            Label(
                title: { Text("First Button") },
                icon: { Image(systemName: "square.and.arrow.up") }
            )
            .font(.headline)
        }
        
        Button {
            print("Second Button was tapped!")
        } label: {
            Label(
                title: { Text("Second Button") },
                icon: { Image(systemName: "hand.tap") }
            )
            .font(.headline)
        }
        
        Button {
            print("Third Button was tapped!")
        } label: {
            Label(
                title: { Text("Third Button") },
                icon: { Image(systemName: "square.and.arrow.down") }
            )
            .font(.headline)
        }
    }
}
