//
//  ContentView.swift
//  AppStorage And UserDefaults
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isEnablingLight") private var isEnablingLight: Bool = false
//    @State private var isEnablingLight: Bool = false
    
    var body: some View {
        VStack {
            self.helloView()
            self.lightBulbView()
            self.touchLightButton {
                self.isEnablingLight.toggle()
            }
        }
        .animation(.easeInOut, value: self.isEnablingLight)
//        .onChange(of: self.isEnablingLight) {
//            UserDefaults.standard.setValue(
//                self.isEnablingLight,
//                forKey: "isEnablingLight"
//            )
//        }
//        .onAppear {
//            self.isEnablingLight = UserDefaults.standard.value(
//                forKey: "isEnablingLight"
//            ) as? Bool ?? false
//        }
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
            Text("Hello, Light Bulb!")
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    private func lightBulbView() -> some View {
        VStack {
            Image(systemName: self.isEnablingLight ? "lightbulb.fill" : "lightbulb")
                .foregroundStyle(self.isEnablingLight ? .yellow : .gray)
                .font(.system(size: 100.0))
                .padding(.bottom, 20.0)
            
            Group {
                Text("Light is: ") +
                Text(self.isEnablingLight ? "ON" : "OFF")
            }
            .font(.headline)
        }
        .frame(width: 200.0, height: 200.0)
        .padding()
        .background(Material.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    private func touchLightButton(action: (@escaping () -> Void) = {}) -> some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Label(
                title: { Text("Turn Light") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
        }
        .buttonStyle(.bordered)
        .font(.headline)
        .tint(self.isEnablingLight ? .gray : .orange)
    }
}

