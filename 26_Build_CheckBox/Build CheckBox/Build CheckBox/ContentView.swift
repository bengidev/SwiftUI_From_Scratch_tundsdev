//
//  ContentView.swift
//  Build CheckBox
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSelected: Bool = false
    @State private var isOtherSelected: Bool = false
    
    var body: some View {
        VStack {
            Group {
                Image(systemName: self.isSelected ? "network" : "network.slash")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .symbolVariant(.fill)
                
                Text(self.isSelected ? "Turn On" : "Turn Off").font(.headline)
                
                Toggle("Turn connection On?", isOn: self.$isSelected)
                    .padding(.bottom, 20)
            }
            
            Group {
                Image(systemName: self.isSelected ? "network" : "network.slash")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .symbolVariant(.fill)
                
                Text(self.isSelected ? "Turn On" : "Turn Off").font(.headline)
                
                Toggle("", isOn: self.$isSelected)
                    .padding(.bottom, 20)
                    .labelsHidden()
            }
            
            Group {
                Toggle(isOn: self.$isOtherSelected) {
                    Image(systemName: self.isOtherSelected ? "network" : "network.slash")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .symbolVariant(.fill)
                    
                    Text(self.isOtherSelected ? "Turn On" : "Turn Off").font(.headline)
                        .padding(.bottom, 20)
                }
                .toggleStyle(.button)
            }
            
            Group {
                Toggle(isOn: self.$isOtherSelected) {
                    Image(systemName: self.isOtherSelected ? "network" : "network.slash")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .symbolVariant(.fill)
                    
                    Text(self.isOtherSelected ? "Turn On" : "Turn Off").font(.headline)
                        .padding(.bottom, 20)
                }
                .toggleStyle(.checkbox())
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
