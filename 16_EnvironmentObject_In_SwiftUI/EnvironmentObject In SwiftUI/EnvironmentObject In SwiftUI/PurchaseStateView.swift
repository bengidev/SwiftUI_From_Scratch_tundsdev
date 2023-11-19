//
//  PurchaseStateView.swift
//  EnvironmentObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct PurchaseStateView: View {
    @EnvironmentObject private var purchaseVM: PurchaseViewModel
    
    var body: some View {
        PurchaseStatusView()
    }
}

#Preview {
    PurchaseStateView()
        .environmentObject(PurchaseViewModel())
}











