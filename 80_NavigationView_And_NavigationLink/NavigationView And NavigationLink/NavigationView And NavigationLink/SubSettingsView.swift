//
//  SubSettingsView.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct SubSettingsView: View {
    @Binding var isGoingSubSettings: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject private var manager: NavigationManager
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                self.titleView()
                self.bindingButton {
                    self.isGoingSubSettings.toggle()
                }
                self.environmentButton {
                    self.dismiss()
                }
                self.marketingOptionsView(
                    tag: Screens.marketingOptions,
                    selection: self.$manager.screen
                ) {
                    self.manager.navigate(to: .marketingOptions)
                }
                self.appVersionView(
                    tag: Screens.appVersion,
                    selection: self.$manager.screen
                ) {
                    self.manager.navigate(to: .appVersion)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct SubSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SubSettingsView(isGoingSubSettings: .constant(false))
            .environmentObject(NavigationManager())
    }
}

private extension SubSettingsView {
    @ViewBuilder
    private func titleView() -> some View {
        VStack {
            Text("Hello, SubSettings Screen!")
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
        .padding(.bottom, 5.0)
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
    
    @ViewBuilder
    private func marketingOptionsView(
        tag: Screens,
        selection: Binding<Screens?>,
        action: (@escaping () -> Void) = {}) -> some View {
            Button {
                action()
            } label: {
                Label(
                    title: { Text("Going to MarketingOptionsView") },
                    icon: { Image(systemName: "cart.fill") }
                )
                .font(.headline)
                .padding()
                .background(Material.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            .padding(.top, 50.0)
            .padding(.bottom, 5.0)
            .background {
                NavigationLink(
                    tag: tag,
                    selection: selection) {
                        MarketingOptionsView()
                    } label: { }
            }
        }
    
    @ViewBuilder
    private func appVersionView(
        tag: Screens,
        selection: Binding<Screens?>,
        action: (@escaping () -> Void) = {}) -> some View {
            Button {
                action()
            } label: {
                Label(
                    title: { Text("Going to AppVersionView") },
                    icon: { Image(systemName: "number.square.fill") }
                )
                .font(.headline)
                .padding()
                .background(Material.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            .padding(.bottom, 5.0)
            .background {
                NavigationLink(
                    tag: tag,
                    selection: selection) {
                        AppVersionView()
                    } label: { }
            }
        }
}
