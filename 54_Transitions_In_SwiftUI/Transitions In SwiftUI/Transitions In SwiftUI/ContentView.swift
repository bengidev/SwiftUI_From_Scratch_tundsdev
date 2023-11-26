//
//  ContentView.swift
//  Transitions In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, transitions!")
            }
            .font(.headline)
            Divider()
            
            ScrollView {
                LazyVGrid(columns: self.columns, spacing: 30.0) {
                    Group {
                        TransitionView(title: "Opacity", 
                                       transition: .opacity)
                        TransitionView(title: "Move Top", 
                                       transition: .move(edge: .top))
                        TransitionView(title: "Move Bottom", 
                                       transition: .move(edge: .bottom))
                        TransitionView(title: "Move Leading", 
                                       transition: .move(edge: .leading))
                        TransitionView(title: "Move Trailing", 
                                       transition: .move(edge: .trailing))
                        TransitionView(title: "Slide", 
                                       transition: .slide)
                        TransitionView(title: "Scale", 
                                       transition: .scale)
                        TransitionView(title: "Scale 50%", 
                                       transition: .scale(scale: 0.5))
                        TransitionView(title: "Scale 10% Top Left",
                                       transition: .scale(scale: 0.1,
                                                          anchor: .topLeading))
                    }
                    
                    Group {
                        let combined = AnyTransition
                            .slide
                            .combined(with: .scale(scale: 0.1))
                            .combined(with: .opacity)
                        TransitionView(title: "Combined Transition", 
                                       transition: combined)
                        
                        let asymmetric = AnyTransition
                            .asymmetric(insertion:
                                    .move(edge: .bottom),
                                        removal: .slide)
                        TransitionView(title: "Asymmetric Transition", 
                                       transition: asymmetric)
                        
                        let first = AnyTransition
                            .move(edge: .bottom)
                            .combined(with: .opacity)
                        let second = AnyTransition
                            .move(edge: .bottom)
                            .combined(with: .scale)
                        let fusion = AnyTransition
                            .asymmetric(insertion: first, removal: second)
                        TransitionView(title: "Fusion Transition",
                                       transition: fusion)
                    }
                }
                .padding(.horizontal, 10.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
