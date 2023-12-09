//
//  ContentView.swift
//  API Call MVVM Combine
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = UserViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                
                if self.vm.isLoading {
                    ProgressView("Loading...")
                        .transition(.scale.combined(with: .opacity))
                        .animation(.smooth, value: self.vm.users)
                }
                
                List {
                    LazyVStack {
                        ForEach(self.vm.users) { user in
                            UserView(user: user)
                            
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.yellow)
                }
                .transition(.scale.combined(with: .opacity))
                .animation(.smooth, value: self.vm.users)
                .listStyle(.plain)
                .navigationTitle("Users")
                .navigationBarTitleDisplayMode(.large)
            }
            .alert(
                isPresented: self.$vm.hasError,
                error: self.vm.errorResult
            ) {
                Button("Retry", action: self.vm.fetchUsersCombine)
            }
            .onAppear {
                self.vm.fetchUsersCombine()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
