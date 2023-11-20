//
//  ContentView.swift
//  Button Styles And Materials
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 80)
                VStack {
                    Button("Validate your identity") { }
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                }
                
                VStack {
                    Button("Validate your identity") { }
                        .tint(.red)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 16) {
                    Text("Button Style Variants for iOS 15.0").bold()
                    
                    Button("Button Style One") { }
                        .tint(.mint)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Style Two") { }
                        .tint(.mint)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Style Three") { }
                        .tint(.mint)
                        .buttonStyle(.borderless)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Style Four") { }
                        .tint(.mint)
                        .buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Style Five") { }
                        .tint(.mint)
                        .buttonStyle(.automatic)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 16) {
                    Text("Button Shape Variants for iOS 15.0").bold()
                    
                    Button("Button Shape One") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Shape Two") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.large)
                    
                    Button("Button Shape Three") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                    
                    Button("Button Shape Four") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.automatic)
                        .controlSize(.large)
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 16) {
                    Text("Button Size Variants for iOS 15.0").bold()
                    
                    Button("Button Size One") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.mini)
                    
                    Button("Button Size Two") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.small)
                    
                    Button("Button Size Three") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.regular)
                    
                    Button("Button Size Four") { }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.large)
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 16) {
                    Text("Button Role Variants for iOS 15.0").bold()
                    
                    Button(role: .destructive) { } label: {
                        Text("Delete")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    Button(role: .destructive) { } label: {
                        Text("Delete")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    
                    Button(role: .cancel) { } label: {
                        Text("Cancel")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    Button(role: .cancel) { } label: {
                        Text("Cancel")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 16) {
                    Text("Button Material Variants for iOS 15.0").bold()
                    
                    Button("Button Material One") { }
                        .padding()
                        .background(.ultraThinMaterial, 
                                    in: RoundedRectangle(cornerRadius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Material Two") { }
                        .padding()
                        .background(.thinMaterial, 
                                    in: RoundedRectangle(cornerRadius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Material Three") { }
                        .padding()
                        .background(.regularMaterial, 
                                    in: RoundedRectangle(cornerRadius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Material Four") { }
                        .padding()
                        .background(.thickMaterial,
                                    in: RoundedRectangle(cornerRadius: 12.0))
                        .controlSize(.large)
                    
                    Button("Button Material Five") { }
                        .padding()
                        .background(.ultraThickMaterial,
                                    in: RoundedRectangle(cornerRadius: 12.0))
                        .controlSize(.large)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.yellow)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
