//
//  ContentView.swift
//  Spacer In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Username: ").bold()
                Text("Unknown")
            }
            .background(.red)
            
            HStack {
                Text("Username: ").bold()
                Text("Unknown")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom, 5)
            .background(.red)
            
            HStack {
                Text("Username: ").bold()
                Text("Unknown")
                Spacer()
            }.background(.green)
            
            HStack {
                Text("Username: ").bold()
                Text("Unknown")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            .background(.green)
            
            HStack {
                Text("Username: ").bold().background(.red)
                Spacer()
                Text("Unknown").background(.green)
            }
            .padding(.bottom, 5)
            .background(.blue)
            
            HStack {
                Text("Username: ").bold().background(.red)
                Spacer(minLength: 50)
                Text("Unknown")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.green)
            }
            .padding(.bottom, 5)
            .background(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
