//
//  ViewModel.swift
//  Refactor Codebase MVVM
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading: Bool = false
    
    @MainActor
    func fetchUsers() async throws -> Void {
        self.isLoading = true
        defer { self.isLoading = false }
        
        let urlString = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try await URLSession.shared.data(from: urlString)
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        let decoder = JSONDecoder()
        self.users = try decoder.decode([User].self, from: data)
    }
}
