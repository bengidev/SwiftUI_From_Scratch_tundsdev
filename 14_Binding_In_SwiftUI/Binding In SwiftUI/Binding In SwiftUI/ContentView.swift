//
//  ContentView.swift
//  Binding In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            CustomLoadingView(isLoading: self.$isLoading)
                .padding(.bottom, 30)
            
            Button(action: {
                self.isLoading.toggle()
            }, label: {
                Text(self.isLoading ? "Stop Loading" : "Start Loading")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
