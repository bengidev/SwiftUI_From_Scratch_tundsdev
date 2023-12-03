//
//  Form_In_SwiftUIApp.swift
//  Form In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import SwiftUI

@main
struct Form_In_SwiftUIApp: App {
    @StateObject private var vm = ContactViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.vm)
        }
    }
}
