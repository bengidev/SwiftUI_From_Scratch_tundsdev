//
//  ContentView.swift
//  Breaking Down SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 18/11/23.
//

import SwiftUI

struct ContentView: View {
    //        @State private var isOpen = false
    //
    //        var body: some View {
    //            VStack {
    //                if isOpen {
    //                    Image(systemName: "arrow.down")
    //                        .rotationEffect(.degrees(0))
    //                } else {
    //                    Image(systemName: "arrow.down")
    //                        .rotationEffect(.degrees(180))
    //                }
    //
    //                Button(action: {
    //                    withAnimation {
    //                        self.isOpen.toggle()
    //                    }
    //                }, label: {
    //                    Text("Toggle Arrow")
    //                })
    //            }
    //            .padding()
    //        }
    
    //    var body: some View {
    //        VStack {
    //
    //            Image(systemName: "arrow.down")
    //                .rotationEffect(.degrees(self.isOpen ? 0 : 180))
    //
    //            Button(action: {
    //                withAnimation {
    //                    self.isOpen.toggle()
    //                }
    //            }, label: {
    //                Text("Toggle Arrow")
    //            })
    //        }
    //        .padding()
    //    }
    
    //    @State private var isMessageShown = false
    //
    //    var body: some View {
    //        VStack {
    //
    //            if self.isMessageShown {
    //                Text("I hope you're enjoying this video")
    //                    .onAppear { print("Added View to screen") }
    //                    .onDisappear { print("Removed view off screen") }
    //            }
    //
    //            Button(action: {
    //                withAnimation {
    //                    self.isMessageShown.toggle()
    //                }
    //            }, label: {
    //                Text("Tap to toggle message")
    //            })
    //        }
    //        .padding()
    //    }
    
    @State private var isOpen = false
    
    var body: some View {
        VStack {
            
            ViewDependencyArrow(isOpen: self.$isOpen)
            
            Button(action: {
                withAnimation {
                    self.isOpen.toggle()
                }
            }, label: {
                Text("Toggle Arrow")
            })
        }
        .padding()
    }
}

struct ViewDependencyArrow: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        Image(systemName: "arrow.down")
            .rotationEffect(.degrees(self.isOpen ? 0 : 180))
    }
}

#Preview {
    ContentView()
}

