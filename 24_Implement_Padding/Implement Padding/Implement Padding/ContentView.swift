//
//  ContentView.swift
//  Implement Padding
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .border(.red, width: 3)
                .padding(.bottom, 10)
            
            Text("Hello, world!")
                .padding(4)
                .border(.red, width: 3)
                .padding(.bottom, 10)
            
            Text("Hello, world!")
                .padding(.leading, 40)
                .padding(.trailing, 40)
                .border(.red, width: 3)
                .padding(.bottom, 10)
            
            Text("Hello, world!")
                .padding(.horizontal, 40)
                .border(.red, width: 3)
                .padding(.bottom, 10)
            
            Text("Hello, world!")
                .padding(.vertical, 40)
                .border(.red, width: 3)
                .padding(.bottom, 10)
            
            VStack {
                Image("apple")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, 150)
                    .border(.red, width: 3)
                
                Text("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet," +
                     " consectetur, adipisci velit...")
                .font(.headline)
                .frame(maxWidth: 200)
                .foregroundStyle(.white)
                .border(.red, width: 3)
            }
            .padding()
            .background(.gray.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .border(.red, width: 3)
        }
    }
}

#Preview {
    ContentView()
}
