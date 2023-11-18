//
//  ContentView.swift
//  Gradients In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
//        ZStack {
//            LinearGradient(colors: [.white, .blue, .black],
//                           startPoint: .top,
//                           endPoint: .bottom)
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.orange)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            LinearGradient(colors: [.white, .blue, .black],
//                           startPoint: .bottom,
//                           endPoint: .top)
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.orange)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            LinearGradient(colors: [.white, .blue, .black],
//                           startPoint: .leading,
//                           endPoint: .trailing)
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.orange)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            LinearGradient(stops: [
//                .init(color: .black, location: 0.2),
//                .init(color: .blue, location: 0.5)],
//                           startPoint: .top,
//                           endPoint: .bottom)
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.orange)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            RadialGradient(colors: [.red, .green, .blue],
//                           center: .center,
//                           startRadius: 100,
//                           endRadius: 200)
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.black)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            AngularGradient(colors: [.red, .green, .blue, .yellow, .purple],
//                            center: .center,
//                            angle: .degrees(90))
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.black)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            Image(systemName: "flame")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .aspectRatio(1, contentMode: .fit)
//                .symbolVariant(.fill)
//                .foregroundStyle(.black)
//                .padding(.all, 100)
//                .background {
//                    AngularGradient(colors: [.red, .green, .blue, .yellow, .purple],
//                                    center: .center,
//                                    angle: .degrees(90))
//                }
//        }
//        .ignoresSafeArea()
        
        ZStack {
            AngularGradient(colors: [.red, .green, .blue, .yellow, .purple],
                            center: .center,
                            angle: .degrees(90))
            .mask {
                Image(systemName: "flame")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(1, contentMode: .fit)
                    .symbolVariant(.fill)
                    .foregroundStyle(.black)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
