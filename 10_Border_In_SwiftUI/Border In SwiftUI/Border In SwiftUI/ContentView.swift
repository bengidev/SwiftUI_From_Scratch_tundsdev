//
//  ContentView.swift
//  Border In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .border(.red, width: 5)
//        .cornerRadius(10)
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .overlay(RoundedRectangle(cornerRadius: 10)
//            .stroke(Color.red, lineWidth: 5))
//
        ZStack {
            Circle()
                .strokeBorder(AngularGradient(colors: [.red, .yellow, .red],
                                              center: .center,
                                              angle: .degrees(90)),
                              lineWidth: 50)
            
            Text("100%")
                .bold()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
