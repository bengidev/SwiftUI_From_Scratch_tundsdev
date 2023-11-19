//
//  PurchaseViewModel.swift
//  EnvironmentObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import Foundation

final class PurchaseViewModel: ObservableObject {
    @Published var hasPurchased: Bool = false
    @Published var isLoading: Bool = false
    
    func purchase() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.isLoading = false
            self?.hasPurchased = true
        }
    }
    
    func resetPurchase() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.isLoading = false
            self?.hasPurchased = false
        }
    }
}
