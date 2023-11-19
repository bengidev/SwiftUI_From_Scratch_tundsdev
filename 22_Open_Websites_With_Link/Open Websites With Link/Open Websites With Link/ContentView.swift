//
//  ContentView.swift
//  Open Websites With Link
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
//                .font(.system(size: 50))
//            
//            Link("Open Apple Developer",
//                 destination: URL.init(string: "https://developer.apple.com/")!)
//            .font(.headline)
//            .padding(.top, 5)
//        }
//        .padding()
        
        VStack {
            Link(destination: URL(string: "https://developer.apple.com/")!) {
                Image("apple")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(.gray)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
