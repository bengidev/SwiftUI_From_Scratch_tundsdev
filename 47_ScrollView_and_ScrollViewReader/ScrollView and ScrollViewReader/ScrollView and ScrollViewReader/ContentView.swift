//
//  ContentView.swift
//  ScrollView and ScrollViewReader
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct ContentView: View {
    
    private var firstProxy: ScrollViewProxy?
    private var secondProxy: ScrollViewProxy?
    
    private let range: ClosedRange<Int> = 0...50
    private let corner: Double = 15.0
    
    var body: some View {
        VStack {
            VStack {
                self.titleText("Vertical Data")
                
                ScrollViewReader { proxy in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(self.range, id: \.self) { item in
                                self.dataText(with: item)
                            }
                        }
                    }
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 10.0)
                    
                    HStack {
                        self.firstButton(with: proxy)
                        Spacer()
                        self.lastButton(with: proxy)
                    }
                    .padding(.horizontal, 10.0)
                }
            }
            .padding(.top, 10.0)
            .frame(maxHeight: 400)
            .background(Material.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: self.corner))
            
            // ====================== COMPONENT SEPARATOR==============================
            
            VStack {
                self.titleText("Horizontal Data")
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.range, id: \.self) { item in
                                self.dataText(with: item)
                            }
                        }
                    }
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 10.0)
                    
                    HStack {
                        self.firstButton(with: proxy)
                        Spacer()
                        self.lastButton(with: proxy)
                    }
                    .padding(.horizontal, 10.0)
                }
            }
            .padding(.top, 10.0)
            .frame(maxWidth: .infinity)
            .background(Material.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: self.corner))
            
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func titleText(_ text: String = "",
                           image: Image = Image(systemName: "globe")) -> some View {
        return VStack {
            image
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, \(text)!").font(.headline)
        }
    }
    
    
    private func dataText(with index: Int) -> some View {
        return Text("Data from \(index)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.mint, in: RoundedRectangle(cornerRadius: self.corner,
                                                         style: .continuous))
    }
    
    private func firstButton(with proxy: ScrollViewProxy) -> some View {
        return Button {
            if let firstIndex = self.range.min() {
                withAnimation {
                    proxy.scrollTo(firstIndex)
                }
            }
        } label: {
            HStack {
                Image(systemName: "arrow.backward")
                    .font(.title2)
                    .symbolVariant(.square.fill)
                Text("Previous")
                    .font(.headline)
            }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 10.0)
        }
    }
    
    private func lastButton(with proxy: ScrollViewProxy) -> some View {
        return Button {
            if let lastIndex = self.range.max() {
                withAnimation {
                    proxy.scrollTo(lastIndex)
                }
            }
        } label: {
            HStack {
                Text("Next")
                    .font(.headline)
                Image(systemName: "arrow.forward")
                    .font(.title2)
                    .symbolVariant(.square.fill)
            }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 10.0)
        }
    }
}
