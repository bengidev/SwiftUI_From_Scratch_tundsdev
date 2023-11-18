//
//  ContentView.swift
//  Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding(.bottom, 30)
            
            // PNG File
            Image("swirl")
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(1, contentMode: .fit)
                .padding(.bottom, 30)
            
            // SVG File
            Image("people")
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(1, contentMode: .fit)
                .padding(.bottom, 30)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
