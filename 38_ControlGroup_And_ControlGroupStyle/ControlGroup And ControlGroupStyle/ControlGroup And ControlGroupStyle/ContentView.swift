//
//  ContentView.swift
//  ControlGroup And ControlGroupStyle
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                VStack {
                    self.quantityLabel()
                    ControlGroup {
                        self.increaseButton()
                        self.decreaseButton()
                    }
                    Divider()
                }
                // ====================== COMPONENT SEPARATOR==============================
                
                VStack {
                    ControlGroup {
                        self.increaseButton()
                        self.decreaseButton()
                    }
                    .controlGroupStyle(.quantity)
                }
                Divider()
                // ====================== COMPONENT SEPARATOR==============================
            }
            .padding(.bottom, 20.0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func quantityLabel() -> some View {
        return Label {
            Text("Quantity")
                .font(.headline)
        } icon: {
            Image(systemName: "basket")
                .imageScale(.large)
        }
    }

    
    private func increaseButton() -> some View {
        return Button { } label: {
            Label("Increase", systemImage: "cart.badge.plus")
        }
    }
    
    private func decreaseButton() -> some View {
        return Button { } label: {
            Label("Decrease", systemImage: "cart.badge.minus")
        }
    }

}
