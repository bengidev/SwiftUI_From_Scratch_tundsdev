//
//  PickerView.swift
//  Picker And PickerStyle
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct PickerView: View {
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
                Text("Hello, PickerView!")
                    .font(.headline)
            }
            .padding(.vertical, 10.0)
            Divider()
            // ====================== COMPONENT SEPARATOR==============================
            
            ScrollView {
                VStack {
                    VStack {
                        Text("Menu Picker Style")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text("Selected Name: \(self.selectedName)")
                        Picker("", selection: self.$selectedName) {
                            ForEach(self.names, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    Divider()
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    VStack {
                        Text("Inline Picker Style")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text("Selected Name: \(self.selectedName)")
                        Picker("", selection: self.$selectedName) {
                            ForEach(self.names, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.inline)
                    }
                    Divider()
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    VStack {
                        Text("Segmented Picker Style")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text("Selected Name: \(self.selectedName)")
                        Picker("", selection: self.$selectedName) {
                            ForEach(self.names, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Divider()
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    VStack {
                        Text("Wheel Picker Style")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text("Selected Name: \(self.selectedName)")
                        Picker("", selection: self.$selectedName) {
                            ForEach(self.names, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    Divider()
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    VStack {
                        Text("Automatic Picker Style")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text("Selected Name: \(self.selectedName)")
                        Picker("", selection: self.$selectedName) {
                            ForEach(self.names, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                    Divider()
                    // ====================== COMPONENT SEPARATOR==============================
                }
            }
            .onAppear {
                withAnimation {
                    self.selectedName = self.names.first ?? ""
                }
            }
        }
    }
}

#Preview {
    PickerView()
}
