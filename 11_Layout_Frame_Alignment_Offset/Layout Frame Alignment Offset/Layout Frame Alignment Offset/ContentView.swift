//
//  ContentView.swift
//  Layout Frame Alignment Offset
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
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
//        .frame(width: 200, height: 250, alignment: .topLeading)
//        .background(.mint)
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//        .background(.mint)
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//        .background(.mint)
//        .clipped()
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
//        .background(.mint)
//        .clipped()
        
        VStack {
            Image("red-bull")
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(1, contentMode: .fit)
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing) {
                    Text("New Version")
                        .foregroundStyle(.white)
                        .font(Font.system(size: 20, weight: .bold))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(.red)
                        .clipShape(Capsule())
                        .offset(x: 30, y: 10)
                }
        }
    }
}

#Preview {
    ContentView()
}
