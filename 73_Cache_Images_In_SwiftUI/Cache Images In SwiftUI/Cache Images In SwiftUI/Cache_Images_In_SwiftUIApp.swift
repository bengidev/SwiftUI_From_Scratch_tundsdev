//
//  Cache_Images_In_SwiftUIApp.swift
//  Cache Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

@main
struct Cache_Images_In_SwiftUIApp: App {
    @StateObject private var vm = MenuViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(self.vm)
            }
        }
    }
}
