//
//  ContentView.swift
//  Custom View Modifiers In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            self.backgroundView()
            
            VStack {
                self.helloView()
                self.exampOneleButton()
                self.exampleTwoButton()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    private func backgroundView() -> some View {
        let colors: [Color] = [.blue, .green]
        
        return LinearGradient(colors: colors,
                              startPoint: .top,
                              endPoint: .bottom)
    }

    private func helloView() -> some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Hello, Custom View Modifiers!")
        }
        .foregroundStyle(Color.white)
        .font(.headline)
    }

    private func exampOneleButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Example One",
                      systemImage: "globe.asia.australia",
                      action: action)
        .modifier(CapsuleButtonViewModifier())
    }
    
    private func exampleTwoButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Example Two",
                      systemImage: "globe.asia.australia",
                      action: action)
        .applyCapsuleButtonStyle()
    }

}

