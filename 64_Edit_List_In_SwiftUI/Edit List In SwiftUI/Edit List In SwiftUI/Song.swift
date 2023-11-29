//
//  Song.swift
//  Edit List In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import Foundation

struct Song: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let isFavorite: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

extension Song {
    static let empty = Song(
        name: "Unknown",
        image: "Unknown",
        isFavorite: false
    )
}
