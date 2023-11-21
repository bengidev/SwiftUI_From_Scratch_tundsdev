//
//  ScreenOneView.swift
//  Custom Tab Bar
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

struct ScreenOneView: View {
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "1.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                    .symbolVariant(.fill)
                
                Text("Screen 1")
                    .foregroundStyle(.black)
                    .font(.headline)
                    .padding(.bottom, 100)
                
                Button("Go Screen 2") { self.router.change(to: .two) }
                    .tint(.yellow)
                    .foregroundStyle(.black)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.regular)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.ignoresSafeArea(edges: .top))
    }
}

#Preview {
    ScreenOneView()
        .environmentObject(TabRouter())
}
