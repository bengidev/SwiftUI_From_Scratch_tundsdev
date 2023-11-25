//
//  ContentView.swift
//  Documentations and Comments
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Main View Aliases
    typealias Action = ((_ type: GameEventSegmentType) -> Void)
    
    // MARK: Main View Constants
    let action: Action
    
    // MARK: Main View Source of Truth
    @StateObject private var vm: GameEventViewViewModelImpl
    
    // MARK: Main View Init
    init(options: [GameEventSegment], action: @escaping Action) {
        _vm = StateObject(wrappedValue: GameEventViewViewModelImpl(options: options))
        self.action = action
    }
    
    // MARK: Main View Body
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// MARK: Main View Preview
#Preview {
    ContentView(options: GameEventSegment.example) { _ in }
}
