//
//  Custom_PopUp_In_SwiftUIApp.swift
//  Custom PopUp In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

@main
struct Custom_PopUp_In_SwiftUIApp: App {
    @StateObject private var vm = SheetViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.vm)
        }
    }
}
