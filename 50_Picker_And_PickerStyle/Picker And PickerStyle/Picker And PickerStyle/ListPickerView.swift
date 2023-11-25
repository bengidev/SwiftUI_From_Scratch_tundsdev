//
//  ListPickerView.swift
//  Picker And PickerStyle
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct ListPickerView: View {
    @State private var selectedName: String = ""
    
    private let names: [String] = [
        "First Person",
        "Second Person",
        "Third Person",
    ]
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, ListPickerView!")
                    .font(.headline)
            }
            .padding(.vertical, 10.0)
            // ====================== COMPONENT SEPARATOR==============================
            
            List {
                Picker("Choose a name: ", selection: self.$selectedName) {
                    ForEach(self.names, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                .padding(.vertical, 10.0)
                // ====================== COMPONENT SEPARATOR==============================
                
                Picker("Choose a name: ", selection: self.$selectedName) {
                    ForEach(self.names, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.inline)
                .padding(.vertical, 10.0)
                // ====================== COMPONENT SEPARATOR==============================
                
                Picker("Choose a name: ", selection: self.$selectedName) {
                    ForEach(self.names, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 10.0)
                // ====================== COMPONENT SEPARATOR==============================
                
                Picker("Choose a name: ", selection: self.$selectedName) {
                    ForEach(self.names, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                .padding(.vertical, 10.0)
                // ====================== COMPONENT SEPARATOR==============================
                
                Picker("Choose a name: ", selection: self.$selectedName) {
                    ForEach(self.names, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.automatic)
                .padding(.vertical, 10.0)
                // ====================== COMPONENT SEPARATOR==============================
            }
        }
    }
}

#Preview {
    ListPickerView()
}
