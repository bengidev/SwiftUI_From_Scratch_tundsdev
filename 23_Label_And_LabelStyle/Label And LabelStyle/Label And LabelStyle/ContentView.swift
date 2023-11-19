//
//  ContentView.swift
//  Label And LabelStyle
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Label("Pick a Color", systemImage: "paintpalette.fill")
                .padding(.bottom, 30)
            
            Label("Apple Logo", image: "apple")
                .padding(.bottom, 30)
            
            Link(destination: URL(string: "https://developer.apple.com/")!) {
                Label {
                    Text("Register to enroll")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .background(.gray)
                        .clipShape(Capsule())
                } icon: {
                    Image("apple")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.all, 5)
                        .background(.gray)
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 30)
            
            Label("Apple Logo", image: "apple")
                .labelStyle(.capsule)
                .padding(.bottom, 30)
            
            Label("Apple Logo", image: "apple")
                .labelStyle(.strongCapsule(with: .green))
                .padding(.bottom, 30)
            
            Label("Apple Logo", image: "apple")
//                .labelStyle(.titleOnly)
//                .labelStyle(.iconOnly)
                .labelStyle(.automatic)
                .padding(.bottom, 30)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
