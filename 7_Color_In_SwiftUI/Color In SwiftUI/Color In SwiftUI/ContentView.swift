//
//  ContentView.swift
//  Color In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Color("SecondaryColor").ignoresSafeArea()
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.red)
//        }
//    }
    
//    var body: some View {
//        ZStack {
//            Color(red: 237 / 255, green: 125 / 255, blue: 49 / 255).ignoresSafeArea()
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.red)
//        }
//    }
    
    var body: some View {
        ZStack {
            Color(uiColor: .init(.orange)).ignoresSafeArea()
            Image(systemName: "flame")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1, contentMode: .fit)
                .symbolVariant(.fill)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ContentView()
}
