//
//  ContentView.swift
//  SafeArea In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textValue: String = ""
    
    private let gradientColors: [Color] = [
        .red, .black, .blue
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                self.backgroundView()
                ScrollView(showsIndicators: true) {
                    Text("Content")
                        .font(.title.bold())
                        .foregroundStyle(.white)
                    
                    TextField("Example", text: self.$textValue)
                        .padding(10.0)
                        .textFieldStyle(.roundedBorder)
                    
                    ForEach(0...20, id: \.self) { item in
                        Text("\(item)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12.0))
                    }
                    .padding(.horizontal, 10.0)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func backgroundView() -> some View {
        return LinearGradient(colors: self.gradientColors,
                              startPoint: .top,
                              endPoint: .bottom)
        .ignoresSafeArea(.container, edges: .bottom)
    }

}
