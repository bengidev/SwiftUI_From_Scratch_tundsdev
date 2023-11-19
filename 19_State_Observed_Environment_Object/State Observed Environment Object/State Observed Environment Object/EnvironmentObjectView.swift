//
//  EnvironmentObjectView.swift
//  State Observed Environment Object
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

/// 1. ObservableObject defined here
///
final class EnvironmentViewModel: ObservableObject {
    @Published var items: [String] = []
    
    func printRandom() -> Void {
        print(Double.random(in: 0..<10))
    }
}

@main
struct StateObservedEnvironmentObjectApp: App {
    /// 2. The instance of Source of Truth created at the root or
    /// at the parent view.
    ///
    @StateObject private var vm = EnvironmentViewModel()
    
    var body: some Scene {
        WindowGroup {
            /// 3. Pass the Source of Truth from the root or parent view
            /// into the Environment Object Modifier
            /// (a.k.a .environmentObject(vm))
            ///
            EnvironmentObjectView()
                .environmentObject(vm)
        }
    }
}

struct EnvironmentObjectView: View {
    /// 4. Property wrapper to receive and accept root Source of Truth
    /// from root or parent view (a.k.a from StateObservedEnvironmentObjectApp)
    ///
    @EnvironmentObject var vm: EnvironmentViewModel
    
    var body: some View {
        /// 5. No need to inject Environment Object into child view,
        /// since it is now accessible view the parent view (a.k.a EnvironmentObjectView)
        ///
        ChildEnvironmentObjectView()
    }
}

#Preview {
    EnvironmentObjectView()
}

struct ChildEnvironmentObjectView: View {
    /// 6. Property wrapper to receive and accept root Source of Truth
    /// from root or parent view (a.k.a from EnvironmentObjectView)
    ///
    @EnvironmentObject var vm: EnvironmentViewModel
    
    var body: some View {
        /// 7. Read from the Source of Truth (EnvironmentViewModel)
        /// from the root (StateObservedEnvironmentObjectApp) and
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
