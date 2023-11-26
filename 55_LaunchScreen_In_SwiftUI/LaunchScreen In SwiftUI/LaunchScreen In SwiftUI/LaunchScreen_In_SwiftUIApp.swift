//
//  LaunchScreen_In_SwiftUIApp.swift
//  LaunchScreen In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

@main
struct LaunchScreen_In_SwiftUIApp: App {
    @StateObject private var manager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if self.manager.state != .completed {
                    LaunchScreenView()
                }
            }
            .environmentObject(self.manager)
        }
    }
}
