//
//  ContentView.swift
//  Manage Colors
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "flame")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1, contentMode: .fit)
                .symbolVariant(.fill)
                .foregroundStyle(.red)
            Text("Accent Color")
                .bold()
                .padding(.bottom, 30)
            
            Image(systemName: "flame")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1, contentMode: .fit)
                .symbolVariant(.fill)
                .foregroundStyle(Color("SecondaryColor"))
            Text("Secondary Color")
                .bold()
                .padding(.bottom, 30)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background { Color.accentColor }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
