//
//  ContentView.swift
//  State In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
//            if self.isOn {
//                Image(systemName: self.isOn ? "bolt.fill" : "bolt")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                
//                Text(self.isOn ? "Bolt is On" : "Bolt is Off")
//                    .font(.system(size: 14, weight: .bold))
//                    .padding(.bottom, 30)
//            } else {
//                Image(systemName: "bolt")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                
//                Text("Bolt is Off")
//                    .font(.system(size: 14, weight: .bold))
//                    .padding(.bottom, 30)
//            }
            
//            Image(systemName: self.isOn ? "bolt.fill" : "bolt")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            
//            Text(self.isOn ? "Bolt is On" : "Bolt is Off")
//                .font(.system(size: 14, weight: .bold))
//                .padding(.bottom, 30)
//            
//            Button(action: {
//                self.isOn.toggle()
//            }, label: {
//                Text("Toggle Me")
//            })
            
            Image(systemName: self.isOn ? "lightbulb.min.fill" : "lightbulb.min")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(self.isOn ? "Light is On" : "Light is Off")
                .font(.system(size: 14, weight: .bold))
                .padding(.bottom, 30)
            
            Toggle(isOn: self.$isOn, label: {
                EmptyView()
            })
            .labelsHidden()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
