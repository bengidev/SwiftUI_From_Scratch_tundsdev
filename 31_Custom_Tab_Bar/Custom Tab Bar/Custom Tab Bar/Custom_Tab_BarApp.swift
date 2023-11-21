//
//  Custom_Tab_BarApp.swift
//  Custom Tab Bar
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

@main
struct Custom_Tab_BarApp: App {
    @StateObject private var router = TabRouter()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: self.$router.screenView) {
                ScreenOneView()
                    .tag(ScreenView.one)
                    .environmentObject(self.router)
                    .tabItem { Label("Screen 1", systemImage: "house.fill") }
                
                ScreenTwoView()
                    .badge(1)
                    .tag(ScreenView.two)
                    .environmentObject(self.router)
                    .tabItem { Label("Screen 2", systemImage: "gamecontroller.fill") }
            }
        }
    }
}

enum ScreenView: Hashable {
    case one
    case two
}

final class TabRouter: ObservableObject {
    @Published var screenView: ScreenView = .one
    
    func change(to view: ScreenView) -> Void {
        self.screenView = view
    }
}
