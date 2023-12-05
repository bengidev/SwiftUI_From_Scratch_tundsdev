//
//  ContentView.swift
//  Custom Data Models
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = User.existingData
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    LazyVStack {
                        ForEach(self.$users, id: \.id) { $user in
                            UserInfoView(user: $user)
                                .buttonStyle(.plain)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
