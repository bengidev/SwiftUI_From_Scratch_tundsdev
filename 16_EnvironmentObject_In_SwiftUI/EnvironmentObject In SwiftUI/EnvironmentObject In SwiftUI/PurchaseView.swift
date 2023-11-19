//
//  PurchaseView.swift
//  EnvironmentObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct PurchaseView: View {
    @EnvironmentObject private var purchaseVM: PurchaseViewModel
    
    var body: some View {
        VStack {
            if self.purchaseVM.isLoading {
                ProgressView {
                    Text("Loading")
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.bottom, 30)
            }
            
            Button(action: self.purchaseVM.purchase, label: {
                Text(self.purchaseVM.hasPurchased ? "Purchased" : "Purchase Me")
                    .font(.system(size: 20, weight: .bold))
            })
            .disabled(self.purchaseVM.isLoading || self.purchaseVM.hasPurchased)
            .opacity(self.purchaseVM.hasPurchased ? 0.5 : 1)
        }
    }
}

#Preview {
    PurchaseView()
        .environmentObject(PurchaseViewModel())
}
