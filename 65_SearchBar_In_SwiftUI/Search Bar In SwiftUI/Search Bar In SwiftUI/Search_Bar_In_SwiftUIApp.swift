//
//  Search_Bar_In_SwiftUIApp.swift
//  Search Bar In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

@main
struct Search_Bar_In_SwiftUIApp: App {
    @StateObject private var vm = PeopleViewModel()
    @State private var query = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView(query: self.$query)
                .environmentObject(self.vm)
                .searchable(text: self.$query)
        }
    }
}
