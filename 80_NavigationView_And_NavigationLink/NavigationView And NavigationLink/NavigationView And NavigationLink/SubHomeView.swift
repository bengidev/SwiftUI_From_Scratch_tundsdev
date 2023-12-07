//
//  SubHomeView.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct SubHomeView: View {
    @Binding var isGoingSubHome: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                self.titleView()
                self.bindingButton {
                    self.isGoingSubHome.toggle()
                }
                self.environmentButton {
                    self.dismiss()
                }
            }
        }
    }
}

struct SubHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SubHomeView(isGoingSubHome: .constant(false))
    }
}

private extension SubHomeView {
    @ViewBuilder
    private func titleView() -> some View {
        VStack {
            Text("Hello, SubHome Screen!")
                .font(.headline)
                .padding()
                .background(Material.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .shadow(radius: 5.0)
                .padding(.bottom, 50.0)
        }
    }
    
    @ViewBuilder
    private func bindingButton(action: (@escaping () -> Void) =
                               {}) -> some View {
        Button {
            action()
        } label: {
            Label(
                title: { Text("Dismiss via Binding") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
            .font(.headline)
            .padding()
            .background(Material.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
        }
        .padding(.bottom, 20.0)
    }

    @ViewBuilder
    private func environmentButton(action: (@escaping () -> Void) =
                               {}) -> some View {
        Button("Dismiss via Environment") {
            action()
        }
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

