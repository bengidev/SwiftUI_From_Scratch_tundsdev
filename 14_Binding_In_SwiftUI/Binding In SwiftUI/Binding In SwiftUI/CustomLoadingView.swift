//
//  CustomLoadingView.swift
//  Binding In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct CustomLoadingView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if self.isLoading {
            ProgressView {
                Text("Loading")
            }
        } else {
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.tint)
                    .imageScale(.large)
                
                Text("Loading Finished")
                    .font(.system(size: 16, weight: .bold))
            }
        }
    }
}

#Preview {
    CustomLoadingView(isLoading: .constant(true))
}
