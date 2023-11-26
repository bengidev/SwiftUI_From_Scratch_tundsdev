//
//  ContentView.swift
//  LaunchScreen In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.launchScreenManager.dismiss()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LaunchScreenManager())
}
