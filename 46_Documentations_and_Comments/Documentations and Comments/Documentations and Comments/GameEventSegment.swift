//
//  GameEventSegment.swift
//  Documentations and Comments
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import Foundation

// MARK: Models

/*
 This type contains all of the options
 that are available for the segment
 in order to add more cases
*/

enum GameEventSegmentType {
    case gameView
    case liveStreaming
}

struct GameEventSegmentTint {
    // Place color config here
    //
}

struct GameEventSegment: Identifiable {
    // Can add icon here
    //
    let id = UUID()
    
    let title: String
    let type: GameEventSegmentType
    let tint: GameEventSegmentTint
}

// MARK: Models Fake Data

extension GameEventSegment {
    // Dummy Data
    //
    static var example: [GameEventSegment] = [
        GameEventSegment(title: "Game View", type: .gameView, tint: .init()),
        GameEventSegment(title: "Live Streaming", type: .liveStreaming, tint: .init()),
    ]
}

// MARK: Models ViewModel

protocol GameEventViewViewModel {
    var active: GameEventSegment? { get }
    var options: [GameEventSegment] { get }
}

class GameEventViewViewModelImpl: ObservableObject, GameEventViewViewModel {
    /// The active segment that hase been selected
    @Published var active: GameEventSegment?
    
    var options: [GameEventSegment]
    
    init(active: GameEventSegment? = nil, options: [GameEventSegment]) {
        self.active = active
        self.options = options
    }
    
    /// Sets the current active segment within the view model
    /// - Parameter segment: The segment type that will now become active
    /// - Returns: Void
    func setSegment(_ segment: GameEventSegment) -> Void {
        self.active = segment
    }
    
    
    /// Some info about our func
    /// - Parameters:
    ///   - item: The item to pass in
    ///   - anotherItem: The second item out pass in
    /// - Returns: Some dummy data
    func getSegment(item: Int, anotherItem: String) -> Int { return item }
}
