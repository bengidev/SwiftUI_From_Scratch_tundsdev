//
//  ContentView.swift
//  App Lifecycle In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingText: Bool = false
    @State private var buttonColor: Color = .accentColor
    
    var body: some View {
        VStack {
            self.helloView()
            self.showTextButton {
                self.isShowingText.toggle()
                self.buttonColor = .accentColor
            }
        }
        .animation(.easeInOut, value: self.buttonColor)
        .sheet(isPresented: self.$isShowingText) {
            self.secondView()
                .onDisappear {
                    self.buttonColor = .black
                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.buttonColor = .orange
            }
        }
        .onChange(of: self.buttonColor) { newValue in
            print("Button Color value: \(newValue)")
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    private func secondView() -> some View {
        VStack {
            Image(systemName: "2.square")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Second View!")
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }

    @ViewBuilder
    private func showTextButton(action: (@escaping () -> Void) = {}) -> some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Label(
                title: { Text("Show Text") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
        }
        .font(.headline)
        .buttonStyle(.bordered)
        .tint(self.buttonColor)
    }

}

