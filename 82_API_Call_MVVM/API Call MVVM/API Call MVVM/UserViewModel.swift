//
//  UserViewModel.swift
//  API Call MVVM
//
//  Created by Bambang Tri Rahmat Doni on 09/12/23.
//

import Foundation

final class UserViewModel: ObservableObject {
    @Published var hasError: Bool = false
    @Published var errorResult: UserError?
    
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading: Bool = false
    
    func fetchUsers() -> Void {
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
