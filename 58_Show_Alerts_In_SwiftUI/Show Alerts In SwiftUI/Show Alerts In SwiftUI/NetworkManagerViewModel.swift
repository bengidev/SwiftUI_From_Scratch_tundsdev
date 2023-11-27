//
//  NetworkManagerViewModel.swift
//  Show Alerts In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import Foundation

final class NetworkManagerViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published private(set) var error: NetworkError?
    
    func fetchNetwork(withError error: NetworkError = .none) -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.error = Int.random(in: 1...5).isMultiple(of: 2) ? .badRequest : .failedToDecode
            self.hasError = true
            self.isLoading = false
        }
    }
}
