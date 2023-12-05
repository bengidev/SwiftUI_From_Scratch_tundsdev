//
//  Simple_Model_View_ViewModelApp.swift
//  Simple Model View ViewModel
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

@main
struct Simple_Model_View_ViewModelApp: App {
    @StateObject private var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label(
                            title: { Text("First") },
                            icon: { Image(systemName: "1.square.fill") }
                        )
                        .font(.headline)
                    }
                
                SecondView()
                    .tabItem {
                        Label(
                            title: { Text("Second") },
                            icon: { Image(systemName: "2.square.fill") }
                        )
                        .font(.headline)
                    }
            }
            .environmentObject(self.vm)
        }
    }
}
