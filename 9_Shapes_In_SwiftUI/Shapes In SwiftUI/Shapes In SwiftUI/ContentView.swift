//
//  ContentView.swift
//  Shapes In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "ellipsis.message")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Shapes")
                .padding(.bottom, 50)
            
            Capsule(style: .circular)
                .frame(width: 100.0, height: 50.0)
            Capsule(style: .continuous)
                .frame(width: 100.0, height: 50.0)
            Circle()
                .frame(width: 50.0, height: 50.0)
            Ellipse()
                .frame(width: 50.0, height: 25.0)
            Rectangle()
                .frame(width: 50.0, height: 50.0)
            RoundedRectangle(cornerRadius: 12.0)
                .frame(width: 50.0, height: 50.0)
            
            RoundedRectangle(cornerRadius: 12.0)
                .fill(.red)
                .frame(width: 50.0, height: 50.0)
            
            Image("swirl")
                .resizable()
                .background(Color.yellow)
                .frame(width: 100.0, height: 100.0)
                .clipShape(Circle())
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


