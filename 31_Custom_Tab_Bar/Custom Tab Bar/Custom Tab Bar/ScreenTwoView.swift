//
//  ScreenTwoView.swift
//  Custom Tab Bar
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

struct ScreenTwoView: View {
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "2.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                    .symbolVariant(.fill)
                Text("Screen 2")
                    .foregroundStyle(.black)
                    .font(.headline)
                    .padding(.bottom, 100)
                
                Button("Go Screen 1") { self.router.change(to: .one) }
                    .tint(.yellow)
                    .foregroundStyle(.black)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.regular)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink.ignoresSafeArea(edges: .top))
    }
}

#Preview {
    ScreenTwoView()
        .environmentObject(TabRouter())
}
