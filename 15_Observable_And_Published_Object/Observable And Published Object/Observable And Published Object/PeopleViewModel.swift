//
//  PeopleViewModel.swift
//  Observable And Published Object
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published var people: [String] = []
    @Published var isLoading: Bool = false
    
    func fetchPeople() -> Void {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.people = ["Beng", "Billy", "Bob", "Aldo"]
            self?.isLoading = false
        }
    }
}
