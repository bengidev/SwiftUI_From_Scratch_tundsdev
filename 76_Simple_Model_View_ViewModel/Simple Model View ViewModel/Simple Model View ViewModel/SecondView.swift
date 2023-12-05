//
//  SecondView.swift
//  Simple Model View ViewModel
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        VStack {
            self.helloView()
            self.numberView()
        }
        .animation(.easeInOut, value: self.vm.data)
    }
}

#Preview {
    SecondView()
        .environmentObject(ViewModel())
}

private extension SecondView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Second View!")
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    private func numberView() -> some View {
        VStack(spacing: 20.0) {
            Text(self.vm.data.number.description)
                .font(
                    .system(
                        size: 80.0,
                        weight: .bold,
                        design: .rounded
                    )
                )
                .bold()
            Text("Number of Taps")
        }
        .frame(width: 200.0, height: 200.0)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
        .padding(.bottom, 20.0)
    }
}
