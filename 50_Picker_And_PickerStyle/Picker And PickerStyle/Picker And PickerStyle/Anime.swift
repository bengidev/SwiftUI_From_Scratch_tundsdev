//
//  Anime.swift
//  Picker And PickerStyle
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import Foundation

enum Anime: Hashable, Identifiable, CaseIterable {
    var id: Self { return self }
    
    case demonSlayer
    case attackOnTitan
    case bokuNoHero
    case none
}

extension Anime {
    var title: String {
        switch self {
        case .demonSlayer:
            "Demon Slayer"
        case .attackOnTitan:
            "Attack On Titan"
        case .bokuNoHero:
            "Boku No Hero"
        case .none:
            "Unknown"
        }
    }
}
