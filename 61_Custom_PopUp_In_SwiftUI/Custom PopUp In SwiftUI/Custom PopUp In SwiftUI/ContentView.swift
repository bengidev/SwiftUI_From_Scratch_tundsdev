//
//  ContentView.swift
//  Custom PopUp In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: SheetViewModel
    
    var body: some View {
        ZStack {
            self.backgroundView()
            
            VStack {
                self.helloView()
                
                self.showCustomSheetButton(title: "Show Custom Sheet One") {
                    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    let config: SheetViewModel.Config = .init(systemName: "info",
                                                              title: "Attention",
                                                              content: text)
                    self.vm.present(with: config)
                }
                
                self.showCustomSheetButton(title: "Show Custom Sheet Two") {
                    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    let config: SheetViewModel.Config = .init(
                        systemName: "exclamationmark",
                        title: "Warning",
                        content: text
                    )
                    self.vm.present(with: config)
                }
            }
        }
        .popupDialog(self.vm, with: .interactiveSpring)
    }
}

#Preview {
    ContentView()
        .environmentObject(SheetViewModel())
}

private extension ContentView {
    @ViewBuilder
    private func backgroundView() -> some View {
        let colors: [Color] = [.green, .blue]
        LinearGradient(colors: colors,
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Custom Popup!")
        }
        .font(.headline)
    }
    
    @ViewBuilder
    private func showCustomSheetButton(title: String = "",
                                       action: (@escaping () -> Void) = {}) -> some View {
        Button {
            withAnimation { action() }
        } label: {
            Label(
                title: { Text(title.isEmpty ? "Show Custom Sheet" : title) },
                icon: { Image(systemName: "hand.tap") }
            )
            .font(.headline)
        }
        .padding(10.0)
        .background(Material.thinMaterial,
                    in: RoundedRectangle(cornerRadius: 15.0))
        .padding(.top, 40.0)
        
    }
    
}

