//
//  Playlist.swift
//  Edit List In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import Foundation

struct Playlist: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let songs: [Song]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

extension Playlist {
    static let playlistOne = Playlist(
        name: "Songs For The Drunk And Broken Hearted",
        image: "music.note.house.fill",
        songs: (1...5).map { number in
            Song(
                name: "Song number \(number.description)",
                image: "play",
                isFavorite: number.isMultiple(of: 2) ? true : false
            )
        }
    )
}
