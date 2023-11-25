//
//  FlavourPickerView.swift
//  Picker And PickerStyle
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct FlavourPickerView: View {
    @State private var selectedFlavour: Flavour = .empty

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "hands.clap")
                    .font(.largeTitle.bold())
                Text("Hello, Flavour Picker!")
                    .font(.headline)
                Divider()
                    .padding(.bottom, 30.0)
            }
            
            VStack {
                HStack {
                    Text("Selected flavour: ")
                    Text("\(self.selectedFlavour.name)")
                        .font(.headline)
                    Text("for")
                    Text("\(self.selectedFlavour.price, format: .currency(code: "USD"))")
                        .font(.headline)
                }
                
                Picker("Select a flavour", selection: self.$selectedFlavour) {
                    ForEach(Flavour.examples) { flavour in
                        HStack {
                            Text(flavour.name)
                                .font(.headline)
                            Text(flavour.price, format: .currency(code: "USD"))
                        }
                        .tag(flavour)
                    }
                }
                .pickerStyle(.automatic)
            }
        }
    }
}

#Preview {
    FlavourPickerView()
}
