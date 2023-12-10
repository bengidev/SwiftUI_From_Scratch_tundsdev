//
//  ContentView.swift
//  Refactor Codebase MVVM
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if self.vm.isLoading {
                    ProgressView("Loading...")
                } else {
                    List {
                        ForEach(self.vm.users) { user in
                            UserInfoView(user: user)
                                .background {
                                    NavigationLink("") {
                                        UserDetailView(user: user)
                                    }
                                    .opacity(0.0)
                                }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(
                            top: 5.0,
                            leading: 10.0,
                            bottom: 5.0,
                            trailing: 10.0)
                        )
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Users")
            .task {
                do {
                    try await self.vm.fetchUsers()
                } catch {
                    print("Task Error: \(error)")
                    dump(error, name: "Task Error")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

