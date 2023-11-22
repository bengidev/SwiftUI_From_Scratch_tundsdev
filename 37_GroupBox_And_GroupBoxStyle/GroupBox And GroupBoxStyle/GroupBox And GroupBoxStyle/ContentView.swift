//
//  ContentView.swift
//  GroupBox And GroupBoxStyle
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GroupBox("Saved Items") {
                Text("You've saved 5 items")
            }
            // ====================== COMPONENT SEPARATOR==============================
            
            GroupBox {
                Text("You've saved 5 items")
            } label: {
                Label("Saved Items", systemImage: "star.fill")
            }
            // ====================== COMPONENT SEPARATOR==============================
            
            GroupBox {
                Text("You've saved 5 items")
            } label: {
                Label("Saved Items", systemImage: "star.fill")
            }
            .groupBoxStyle(.saved())
            // ====================== COMPONENT SEPARATOR==============================
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mint)
    }
}

#Preview {
    ContentView()
}
