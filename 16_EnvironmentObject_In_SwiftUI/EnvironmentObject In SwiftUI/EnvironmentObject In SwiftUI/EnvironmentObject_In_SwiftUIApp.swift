//
//  EnvironmentObject_In_SwiftUIApp.swift
//  EnvironmentObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

@main
struct EnvironmentObject_In_SwiftUIApp: App {
    @StateObject private var purchaseVM = PurchaseViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                PurchaseView()
                    .environmentObject(self.purchaseVM)
                    .tabItem {
                        Image(systemName: "creditcard")
                            .symbolVariant(.fill)
                        
                        Text("Purchase")
                            .font(.system(size: 14, weight: .bold))
                    }
                
                PurchaseStateView()
                    .environmentObject(self.purchaseVM)
                    .tabItem {
                        Image(systemName: "gearshape")
                            .symbolVariant(.fill)
                        
                        Text("State")
                            .font(.system(size: 14, weight: .bold))
                    }
            }
        }
    }
}
