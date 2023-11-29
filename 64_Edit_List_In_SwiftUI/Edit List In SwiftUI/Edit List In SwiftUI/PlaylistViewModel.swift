//
//  PlaylistViewModel.swift
//  Edit List In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import Foundation

@MainActor
final class PlaylistViewModel: ObservableObject {
    @Published private(set) var playlistOne = Playlist.playlistOne
    
    var playlistOneFavorites: [Song] {
        return self.playlistOne.songs.filter { $0.isFavorite }
    }
    
    func toggleFavorite(for song: Song) -> Void {
        var changedSongs = [Song]()
        
        for (index, tempSong) in self.playlistOne.songs.enumerated() where tempSong.id == song.id {
            let tempSong = Song(name: tempSong.name, image: tempSong.image, isFavorite: !tempSong.isFavorite)
            var tempSongs = self.playlistOne.songs
            tempSongs.remove(at: index)
            tempSongs.insert(tempSong, at: index)
            changedSongs = tempSongs
        }
        
        self.playlistOne = Playlist(name: self.playlistOne.name, image: self.playlistOne.image, songs: changedSongs)
    }
    
    func delete(_ song: Song?) -> Void {
        guard !self.playlistOne.songs.isEmpty else { return }
        guard let song = song else { return }
        
        let songIndex = self.playlistOne.songs.firstIndex(of: song) ?? 0
        var changedSongs = self.playlistOne.songs
        changedSongs.remove(at: songIndex)
        
        self.playlistOne = Playlist(name: self.playlistOne.name, image: self.playlistOne.image, songs: changedSongs)
    }
    
    func delete(_ indexSet: IndexSet) -> Void {
        guard !self.playlistOne.songs.isEmpty else { return }
        
        var changedSongs = self.playlistOne.songs
        changedSongs.remove(atOffsets: indexSet)
        
        self.playlistOne = Playlist(name: self.playlistOne.name, image: self.playlistOne.image, songs: changedSongs)
    }
    
    func swap(from oldIndexSet: IndexSet, to newIndex: Int) -> Void {
        guard !self.playlistOne.songs.isEmpty else { return }
        
        var changedSongs = self.playlistOne.songs
        changedSongs.move(fromOffsets: oldIndexSet, toOffset: newIndex)
        
        self.playlistOne = Playlist(name: self.playlistOne.name, image: self.playlistOne.image, songs: changedSongs)
    }
}
