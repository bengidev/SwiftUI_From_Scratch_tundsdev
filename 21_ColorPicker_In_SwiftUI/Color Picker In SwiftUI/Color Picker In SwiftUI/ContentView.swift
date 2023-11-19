//
//  ContentView.swift
//  Color Picker In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var color: Color = .white
    
    var body: some View {
        VStack {
            Image("welcome")
                .resizable()
                .frame(width: 200, height: 100)
                .background(self.color, in: RoundedRectangle(cornerRadius: 15.0))
                .padding(.bottom, 30)
            
            ColorPicker("", selection: self.$color).labelsHidden()
            
            Text("Select Color").font(.headline)
                .padding(.top, 5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
