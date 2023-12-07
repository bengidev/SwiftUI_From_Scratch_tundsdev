//
//  FileManager_And_NSCacheApp.swift
//  FileManager And NSCache
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

@main
struct FileManager_And_NSCacheApp: App {
    @StateObject private var vm = MenuViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.vm)
        }
    }
}
