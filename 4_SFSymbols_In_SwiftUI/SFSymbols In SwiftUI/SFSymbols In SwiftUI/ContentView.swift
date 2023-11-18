//
//  ContentView.swift
//  SFSymbols In SwiftUI
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
                .padding(.bottom, 30)
            
            Label(
                title: { Text("Cloudy #1") },
                icon: {
                    Image(systemName: "cloud.sun")
                        .symbolRenderingMode(.monochrome)
                        .imageScale(.small)
                })
            
            Label(
                title: { Text("Cloudy #2") },
                icon: {
                    Image(systemName: "cloud.sun")
                        .symbolRenderingMode(.multicolor)
                        .imageScale(.medium)
                })
            
            Label(
                title: { Text("Cloudy #3") },
                icon: {
                    Image(systemName: "cloud.sun")
                        .symbolRenderingMode(.hierarchical)
                        .imageScale(.large)
                })
            
            Label(
                title: { Text("Cloudy #4") },
                icon: {
                    Image(systemName: "cloud.sun")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .gray)
                        .imageScale(.large)
                })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .symbolVariant(.fill)
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)
        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .teal]),
                                   startPoint: .top,
                                   endPoint: .bottom))
        
    }
}

#Preview {
    ContentView()
}
