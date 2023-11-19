//
//  ObservedObjectView.swift
//  State Observed Environment Object
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

/// 1. ObservableObject defined here
///
final class ObservedViewModel: ObservableObject {
    @Published var items: [String] = []
    
    func printRandom() -> Void {
        print(Double.random(in: 0..<10))
    }
}

struct ObservedObjectView: View {
    /// 2. The instance of Source of Truth created in the relevant view
    ///
    @StateObject private var vm = ObservedViewModel()
    
    /// 3. Source of Truth for this view passed into the child
    ///
    var body: some View {
        ChildObservedObjectView(vm: vm)
    }
}

#Preview {
    ObservedObjectView()
}

struct ChildObservedObjectView: View {
    /// 4. Property wrapper to receive and accept Source of Truth
    /// from parent (a.k.a from ObservedObjectView)
    ///
    @ObservedObject var vm: ObservedViewModel
    
    var body: some View {
        /// 5. Read from the Source of Truth (ObservedViewModel) and
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
