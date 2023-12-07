//
//  DeepScreensView.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct SubmitMarketingOptionsView: View {
    @EnvironmentObject private var manager: NavigationManager
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            self.titleView()
            self.rootButton {
                self.manager.navigateToRoot()
            }
            self.previousButton {
                self.dismiss()
            }
        }
    }
}

struct SubmitMarketingOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitMarketingOptionsView()
            .environmentObject(NavigationManager())
    }
}

private extension SubmitMarketingOptionsView {
    @ViewBuilder
    private func titleView() -> some View {
        Text("Hello, SubmitMarketingOptionsView!")
            .font(.headline)
            .padding()
            .background(Material.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(radius: 5.0)
    }
    
    @ViewBuilder
    private func rootButton(action: (@escaping () -> Void) =
                            {}) -> some View {
        Button {
            action()
        } label: {
            Label(
                title: { Text("Going to Root View") },
                icon: { Image(systemName: "arrow.up.forward.app.fill") }
            )
            .font(.headline)
            .padding()
            .background(Material.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
        }
        .padding(.top, 20.0)
    }
    
    @ViewBuilder
    private func previousButton(action: (@escaping () -> Void) =
                                {}) -> some View {
        Button {
            action()
        } label: {
            Label(
                title: { Text("Going to Previous View") },
                icon: { Image(systemName: "arrowshape.turn.up.left.fill") }
            )
            .font(.headline)
            .padding()
            .background(Material.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
        }
        .padding(.top, 5.0)
    }
}


