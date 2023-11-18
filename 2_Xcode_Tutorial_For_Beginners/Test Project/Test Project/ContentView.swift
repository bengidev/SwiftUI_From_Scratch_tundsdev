//
//  ContentView.swift
//  Test Project
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
                .foregroundColor(.accentColor)
                .padding(.bottom, 10)
            
            Button("Button") {
                print("Button was tapped!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
