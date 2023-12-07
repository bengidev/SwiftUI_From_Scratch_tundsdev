//
//  ExtraScreensView.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct MarketingOptionsView: View {
    var body: some View {
        VStack {
            self.titleView()
            self.submitMarketingOptionsLink {
                SubmitMarketingOptionsView()
            }
        }
    }
}

struct MarketingOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketingOptionsView()
    }
}

private extension MarketingOptionsView {
    @ViewBuilder
    private func titleView() -> some View {
        Text("Hello, MarketingOptionsView!")
            .font(.headline)
            .padding()
            .background(Material.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(radius: 5.0)
    }
    
    @ViewBuilder
    private func submitMarketingOptionsLink(view: (@escaping () -> some View) =
                          { EmptyView() }) -> some View {
        NavigationLink {
            view()
        } label: {
            Label(
                title: { Text("Going to SubmitMarketingOptionsView") },
                icon: { Image(systemName: "paperplane.circle.fill") }
            )
            .font(.headline)
            .padding()
            .background(Material.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
        }
        .padding(.top, 20.0)
    }
}



struct AppVersionView: View {
    var body: some View {
        self.titleView()
    }
}

struct AppVersionView_Previews: PreviewProvider {
    static var previews: some View {
        AppVersionView()
    }
}

private extension AppVersionView {
    @ViewBuilder
    private func titleView() -> some View {
        Text("Hello, AppVersionView!")
            .font(.headline)
            .padding()
            .background(Material.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(radius: 5.0)
    }
}


