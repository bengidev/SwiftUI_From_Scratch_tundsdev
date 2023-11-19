//
//  PurchaseStatusView.swift
//  EnvironmentObject In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct PurchaseStatusView: View {
    @EnvironmentObject private var purchaseVM: PurchaseViewModel
    
    var body: some View {
        VStack {
            Image(systemName: self.purchaseVM.hasPurchased ? "lock.open" : "lock")
                .font(.system(size: 50))
                .symbolVariant(.fill)
            
            Text("User \(self.purchaseVM.hasPurchased ? "has" : "hasn't") " +
                 "unlocked this feature"
            )
            .font(.system(size: 20, weight: .bold))
            .padding(.top, 20)
            
            if self.purchaseVM.hasPurchased {
                if self.purchaseVM.isLoading {
                    ProgressView {
                        Text("Loading")
                            .font(.system(size: 20, weight: .bold))
                    }
                    .padding(.bottom, 30)
                }
                
                Button(action: self.purchaseVM.resetPurchase, label: {
                    Text(self.purchaseVM.hasPurchased ? "Reset Purchase" : "Purchase Resetted")
                        .font(.system(size: 20, weight: .bold))
                })
                .disabled(self.purchaseVM.isLoading || !self.purchaseVM.hasPurchased)
                .opacity(self.purchaseVM.hasPurchased ? 1 : 0.5)
                .padding(.top, 30)
            }
        }
    }
}

#Preview {
    PurchaseStatusView()
        .environmentObject(PurchaseViewModel())
}
