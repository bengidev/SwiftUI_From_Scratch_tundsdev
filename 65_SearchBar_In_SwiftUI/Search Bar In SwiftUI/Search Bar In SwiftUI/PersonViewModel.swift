//
//  PersonViewModel.swift
//  Search Bar In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import Foundation

@MainActor
final class PeopleViewModel: ObservableObject {
    @Published var filteredData: [Person] = []
    @Published private(set) var data: [Person] = [
        Person(name: "Billy Bob", gender: .male),
        Person(name: "Paschalis Ausma", gender: .male),
        Person(name: "Napoleon Donovan", gender: .male),
        Person(name: "Woodrow Ortega", gender: .male),
        Person(name: "Renee Guzman", gender: .male),
        Person(name: "Bradford Powell", gender: .male),
        Person(name: "Hattie James", gender: .male),
        Person(name: "Eloise Wolfe", gender: .male),

        Person(name: "Gunna Wido", gender: .genderNeutral),
        Person(name: "Citlalli Laokoon", gender: .genderNeutral),
        Person(name: "Antoniu Mina", gender: .genderNeutral),
        Person(name: "Karla Sharp", gender: .genderNeutral),
        Person(name: "Flora Elliott", gender: .genderNeutral),
        Person(name: "Ana Lawrence", gender: .genderNeutral),
        Person(name: "Angel Powers", gender: .genderNeutral),

        Person(name: "Anantha Rufus", gender: .female),
        Person(name: "Kephalos Akanksha", gender: .female),
        Person(name: "Kerry Mitchell", gender: .female),
        Person(name: "Geraldine Howard", gender: .female),
        Person(name: "Cecilia Ray", gender: .female),
        Person(name: "Johanna Castillo", gender: .female),
        Person(name: "Leah Perez", gender: .female),
        Person(name: "Lora Mccormick", gender: .female),
    ]
    
    func search(with query: String = "") -> Void {
        self.filteredData = query.isEmpty ?
        self.data :
        self.data.filter { $0.name.localizedCaseInsensitiveContains(query) }
    }
}
