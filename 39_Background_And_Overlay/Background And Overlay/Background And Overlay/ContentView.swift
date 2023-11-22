//
//  ContentView.swift
//  Background And Overlay
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("10")
                    .padding()
                    .font(.headline)
                    .background(.yellow)
                // ====================== COMPONENT SEPARATOR==============================
                
                Text("10")
                    .padding()
                    .font(.headline)
                    .background {
                        Image(systemName: "star")
                            .symbolVariant(.fill)
                            .foregroundStyle(.white)
                            .font(.system(size: 32))
                            .offset(y: -2.0)
                    }
                    .background(.yellow)
                // ====================== COMPONENT SEPARATOR==============================
                
                Text("10")
                    .padding()
                    .font(.headline)
                    .background {
                        Circle().fill(.yellow)
                        
                        Image(systemName: "star")
                            .symbolVariant(.fill)
                            .foregroundStyle(.white)
                            .font(.system(size: 32))
                            .offset(y: -2.0)
                    }
                // ====================== COMPONENT SEPARATOR==============================
                
                Text("10")
                    .padding()
                    .font(.headline)
                    .background(alignment: .top) {
                        Image(systemName: "star")
                            .symbolVariant(.fill)
                            .foregroundStyle(.yellow)
                            .font(.system(size: 32))
                            .offset(y: -2.0)
                    }
                // ====================== COMPONENT SEPARATOR==============================
                
                Image("apple")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 150, height: 100)
                    .padding(10.0)
                    .background{
                        Circle()
                            .fill(Color.yellow)
                    }
                    .overlay(alignment: .bottom) {
                        Text("Think Different")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(5.0)
                            .background {
                                Capsule()
                                    .fill(Color.red)
                            }
                        
                    }
                // ====================== COMPONENT SEPARATOR==============================
                
                Image("apple")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 150, height: 100)
                    .padding(10.0)
                    .background{
                        Circle()
                            .fill(Color.yellow)
                    }
                    .overlay(alignment: .bottom) {
                        Text("Think Different")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(5.0)
                            .background(Material.ultraThin, in: Capsule())
                        
                    }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.gray.opacity(0.7))
    }
}

#Preview {
    ContentView()
}
