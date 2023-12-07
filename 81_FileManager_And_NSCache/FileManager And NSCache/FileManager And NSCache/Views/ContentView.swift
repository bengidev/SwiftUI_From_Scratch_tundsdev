//
//  ContentView.swift
//  FileManager And NSCache
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: MenuViewModel
    
    var body: some View {
        List {
            ForEach(vm.data) { item in
                FoodItemView(item: item)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Menu")
    }
}

#Preview {
    ContentView()
        .environmentObject(MenuViewModel())
}
