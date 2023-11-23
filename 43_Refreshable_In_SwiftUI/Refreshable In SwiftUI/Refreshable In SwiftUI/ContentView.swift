//
//  ContentView.swift
//  Refreshable In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.refresh) var refreshAction
    @StateObject private var viewModel = ViewModel()
    @State private var singleSelection: UUID?
    @State private var isSectionExpanded: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(selection: self.$singleSelection) {
                    self.hintText()
                    
                    ForEach(self.viewModel.animalFamilies, id: \.self) { family in
                        Section("\(family.type.rawValue) Family") {
                            ForEach(family.animals, id: \.self) { animal in
                                Text("\(animal.name)")
                            }
                        }
                    }
                }
                .refreshable {
                    withAnimation {
                        self.viewModel.generateAllSingleRandomAnimal()
                    }
                }
            }
            .navigationTitle("Random Person")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    if self.viewModel.isLoading {
                        ProgressView()
                    } else {
                        Button("Refresh",
                               systemImage: "arrow.counterclockwise.circle") {
                            withAnimation {
                                self.viewModel.generateAllSingleRandomAnimal()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func hintText() -> some View {
        return Text("Pull me down to generate a New Animal")
            .multilineTextAlignment(.center)
            .allowsTightening(true)
            .font(.system(size: 16.0, weight: .bold))
    }
}
