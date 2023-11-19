//
//  StateObjectView.swift
//  State Observed Environment Object
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

/// 1. ObservableObject defined here
///
final class StateViewModel: ObservableObject {
    @Published var items: [String] = []
    
    func printRandom() -> Void {
        print(Double.random(in: 0..<10))
    }
}

struct StateObjectView: View {
    /// 2. The instance of Source of Truth created in the relevant view
    ///
    @StateObject private var vm = StateViewModel()
    
    var body: some View {
        /// 3. Read from the Source of Truth (StateViewModel) and
        /// reflect changes in the UI
        ///
        VStack {
            Text("Number of items: \(self.vm.items.count)")
            
            Button(action: self.vm.printRandom, label: {
                Text("Print Random")
            })
            .padding(.top, 30)
        }
    }
}

#Preview {
    StateObjectView()
}
