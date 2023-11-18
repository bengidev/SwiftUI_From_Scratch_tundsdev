//
//  ContentView.swift
//  State And Data Flow
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Image(systemName: "lightbulb.max")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(isOn ? .yellow : .black)
                .symbolVariant(isOn ? /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/ : .none)
            
            Text(isOn ? "Light is On" : "Light is Off")
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 30)
            
            Toggle(isOn: self.$isOn) {
                Text("Change Light")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
}

#Preview {
    ContentView()
}
