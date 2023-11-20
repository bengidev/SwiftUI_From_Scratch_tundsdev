//
//  ContentView.swift
//  Stepper In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var moneyQuantity: Int = 0
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "coloncurrencysign.circle")
                    .font(.largeTitle)
                    .foregroundStyle(.tint)
                    .symbolVariant(.fill)
                
                Text("The amount of your money: \(self.moneyQuantity)$").bold()
                
                Stepper("Change Amount", value: self.$moneyQuantity, in: 0...100, step: 5)
            }.padding(.bottom, 20)
            
            VStack {
                Image(systemName: "coloncurrencysign.circle")
                    .font(.largeTitle)
                    .foregroundStyle(.tint)
                    .symbolVariant(.fill)
                
                Text("The amount of your money: \(self.moneyQuantity)$").bold()
                
                Stepper("Change Amount", value: self.$moneyQuantity, in: 0...100, step: 5)
                    .labelsHidden()
            }.padding(.bottom, 20)
            
            VStack {
                Stepper(value: self.$moneyQuantity, in: 0...100, step: 5) {
                    HStack {
                        Image(systemName: "coloncurrencysign.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.tint)
                            .symbolVariant(.fill)
                        
                        Text("The amount of your money: \(self.moneyQuantity)$").bold()
                    }
                }
            }.padding(.bottom, 20)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
