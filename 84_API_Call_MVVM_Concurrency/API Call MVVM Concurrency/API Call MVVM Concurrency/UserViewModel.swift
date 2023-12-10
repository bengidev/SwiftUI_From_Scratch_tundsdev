//
//  UserViewModel.swift
//  API Call MVVM Concurrency
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import Combine
import Foundation

final class UserViewModel: ObservableObject {
    @Published var hasError: Bool = false
    @Published var errorResult: UserError?
    
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading: Bool = false
    
    private var bag: Set<AnyCancellable> = []
    
    func fetchUsersDataTask() -> Void {
        self.hasError = false
        self.isLoading = true
        
        let urlString = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        var urlRequest = URLRequest(url: urlString)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            
            if let error = error {
                // Error
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    print("GET Error: \(error) | Code: \(statusCode)")
                    dump("Error: \(error) | Code: \(statusCode)", name: "GET Error")
                    
                    self?.hasError = true
                    self?.errorResult = .external(error: error)
                    self?.isLoading = false
                }
            } else {
                let decoder = JSONDecoder()
                // Handle properties that looks like first_name -> firstName
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data,
                   let users = try? decoder.decode([User].self, from: data) {
                    // Data
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        print("GET Result: \(data)")
                        dump(data, name: "GET Result")
                        
                        self?.users = users
                        self?.isLoading = false
                    }
                } else {
                    // Data Error
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        print("Data Error: \(String(describing: error)) " +
                              "| Code: \(statusCode)")
                        dump("Data Error: \(String(describing: error)) " +
                             "| Code: \(statusCode)", name: "Data Error")
                        
                        self?.hasError = true
                        self?.errorResult = .failedToDecode
                        self?.isLoading = false
                    }
                }
            }
        }
        .resume()
    }
    
    @MainActor
    func fetchUsersConcurrency() async -> Void {
        self.hasError = false
        
        self.isLoading = true
        defer { self.isLoading = false }
        
        let urlString = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let decoder = JSONDecoder()
        
        var urlRequest = URLRequest(url: urlString)
        urlRequest.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode <= 300
            else {
                try await Task.sleep(nanoseconds: 3_000_000_000)
                
                self.hasError = true
                self.errorResult = UserError.invalidStatusCode
                return
            }
            
            guard let users = try? decoder.decode([User].self, from: data) else {
                try await Task.sleep(nanoseconds: 3_000_000_000)
                
                self.hasError = true
                self.errorResult = UserError.failedToDecode
                return
            } 

            try await Task.sleep(nanoseconds: 3_000_000_000)
            self.users = users
        } catch {
            self.hasError = true
            self.errorResult = .external(error: error)
        }
    }
    
    func fetchUsersCombine() -> Void {
        self.hasError = false
        self.isLoading = true
        
        let urlString = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTaskPublisher(for: urlString)
            .receive(on: DispatchQueue.main)
            .tryMap { result in
                let decoder = JSONDecoder()
                
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else {
                    throw UserError.invalidStatusCode
                }
                
                guard let users = try? decoder.decode([User].self, from: result.data) else {
                    throw UserError.failedToDecode
                }
                
                return users
            }
            .sink { [weak self] error in
                print("Task Publisher Error: \(error)")
                dump(error, name: "Task Publisher Error")
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    defer {
                        self?.isLoading = false
                    }
                    
                    if case .failure(let error) = error {
                        self?.errorResult = .external(error: error)
                        self?.hasError = true
                    }
                }
            } receiveValue: { [weak self] users in
                print("Receive Value: \(users)")
                dump(users, name: "Receive Value")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self?.users = users
                    self?.hasError = false
                    self?.isLoading = false
                }
            }
            .store(in: &self.bag)
    }
    
    func postUser(_ user: User = .empty) -> Void {
        let urlString = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let encoder = JSONEncoder()
        let postData = try? encoder.encode(user)
        print("POST Data: \(String(describing: postData))")
        dump(postData, name: "POST Data")
        
        var urlRequest = URLRequest(url: urlString)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = postData
        urlRequest.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            
            if let error = error {
                // Error
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    print("POST Error: \(error) | Code: \(statusCode)")
                    dump("Error: \(error) | Code: \(statusCode)", name: "POST Error")
                    
                    self?.hasError = true
                    self?.errorResult = .external(error: error)
                    self?.isLoading = false
                }
            } else {
                if let data = data {
                    // Data
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        print("POST Result: \(data)")
                        dump(data, name: "POST Result")
                        
                        self?.isLoading = false
                    }
                } else {
                    // Data Error
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        print("Data Error: \(String(describing: error)) " +
                              "| Code: \(statusCode)")
                        dump("Data Error: \(String(describing: error)) " +
                             "| Code: \(statusCode)", name: "Data Error")
                        
                        self?.hasError = true
                        self?.errorResult = .failedToDecode
                        self?.isLoading = false
                    }
                }
            }
        }
        .resume()
    }
}


