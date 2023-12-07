//
//  SettingsView.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var manager: NavigationManager
    
    @State private var isGoingSubSettings: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.teal
                    .ignoresSafeArea()
                
                VStack {
                    self.titleView()
                    self.subSettingsLink {
                        SubSettingsView(isGoingSubSettings: self.$isGoingSubSettings)
                    }
                    self.subSettingsButton {
                        self.isGoingSubSettings.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    self.appVersionLink(
                        tag: .appVersion,
                        selection: self.$manager.screen
                    )
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    self.marketingOptionsLink(
                        tag: .marketingOptions,
                        selection: self.$manager.screen
                    )
                    
                    self.submitMarketingOptionsLink(
                        tag: .submitMarketingOptions,
                        selection: self.$manager.screen
                    )
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(NavigationManager())
    }
}

private extension SettingsView {
    @ViewBuilder
    private func titleView() -> some View {
        VStack {
            Text("Hello, Settings Screen!")
                .font(.headline)
                .padding()
                .background(Material.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .shadow(radius: 5.0)
                .padding(.bottom, 50.0)
        }
    }
    
    @ViewBuilder
    private func subSettingsLink(view: (@escaping () -> some View) =
                          { EmptyView() }) -> some View {
        NavigationLink {
            view()
        } label: {
            Label(
                title: { Text("Go to SubSettings") },
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
    private func subSettingsButton(action: (@escaping () -> Void) =
                          {}) -> some View {
        Group {
            Button("Go to SubSettings") {
                action()
            }
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            NavigationLink(isActive: self.$isGoingSubSettings) {
                SubSettingsView(isGoingSubSettings: self.$isGoingSubSettings)
            } label: { }
        }
    }
    
    @ViewBuilder
    private func appVersionLink(tag: Screens,
                                selection: Binding<Screens?>) -> some View {
        NavigationLink(
            tag: tag,
            selection: selection) {
            AppVersionView()
        } label: {
            Image(systemName: "number.square.fill")
                .tint(Color.white)
        }
    }

    @ViewBuilder
    private func marketingOptionsLink(tag: Screens,
                                selection: Binding<Screens?>) -> some View {
        NavigationLink(
            tag: tag,
            selection: selection) {
            MarketingOptionsView()
        } label: {
            Image(systemName: "cart.fill")
                .tint(Color.white)
        }
    }
    
    @ViewBuilder
    private func submitMarketingOptionsLink(tag: Screens,
                                selection: Binding<Screens?>) -> some View {
        NavigationLink(
            tag: tag,
            selection: selection) {
            SubmitMarketingOptionsView()
        } label: {
            Image(systemName: "creditcard.fill")
                .tint(Color.white)
        }
    }
}

