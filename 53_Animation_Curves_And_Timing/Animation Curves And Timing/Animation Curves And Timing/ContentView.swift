//
//  ContentView.swift
//  Animation Curves And Timing
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        VStack {
            self.helloView()
            Divider()
         
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(AnimationConfig.options) { animation in
                        FirstAnimationView(animationConfig: animation)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func helloView() -> some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .font(.headline)
    }

}
