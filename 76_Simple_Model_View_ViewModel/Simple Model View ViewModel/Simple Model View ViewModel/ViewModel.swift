//
//  ViewModel.swift
//  Simple Model View ViewModel
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    @Published private (set) var data: Model = .standard
    
    func increment(by value: Int) -> Void {
        self.data.increment(by: value)
    }
}
