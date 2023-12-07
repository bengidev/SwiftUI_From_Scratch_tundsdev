//
//  HomeView.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isGoingSubHome: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mint
                    .ignoresSafeArea()
                
                VStack {
                    self.titleView()
                    self.subHomeLink {
                        SubHomeView(isGoingSubHome: self.$isGoingSubHome)
                    }
                    self.subHomeButton {
                        self.isGoingSubHome.toggle()
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private extension HomeView {
    @ViewBuilder
    private func titleView() -> some View {
        VStack {
            Text("Hello, Home Screen!")
                .font(.headline)
                .padding()
                .background(Material.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .shadow(radius: 5.0)
                .padding(.bottom, 50.0)
        }
    }
    
    @ViewBuilder
    private func subHomeLink(view: (@escaping () -> some View) =
                             { EmptyView() }) -> some View {
        NavigationLink {
            view()
        } label: {
            Label(
                title: { Text("Go to SubHome") },
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
    private func subHomeButton(action: (@escaping () -> Void) =
                               {}) -> some View {
        Group {
            Button("Go to SubHome") {
                self.isGoingSubHome.toggle()
            }
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            NavigationLink(isActive: self.$isGoingSubHome) {
                SubHomeView(isGoingSubHome: self.$isGoingSubHome)
            } label: { }
        }
    }
}
