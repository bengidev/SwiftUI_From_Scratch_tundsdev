//
//  ContentView.swift
//  List In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

struct Product: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

struct ContentView: View {
    @State private var seledtedItems = Set<UUID>()
    
    private var items = (1...100).map { Product(name: "Data for number \($0.description)",
                                                image: $0.description) }
    
    var body: some View {
        NavigationView {
            ZStack {
                self.backgroundView()
                    .ignoresSafeArea()
                
                List(selection: self.$seledtedItems) {
                    ForEach(self.items) { item in
                        LazyVStack(alignment: .leading) {
                            self.productView(item)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.yellow)
                        .listRowInsets(.init(top: 0.0,
                                             leading: 20.0,
                                             bottom: 0.0,
                                             trailing: 0.0))
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("List Example")
            .navigationBarTitleDisplayMode(.large)
            .toolbar { EditButton() }
        }
    }
}

#Preview("Automatic Style") {
    ContentView()
        .listStyle(.automatic)
}

#Preview("Plain Style") {
    ContentView()
        .listStyle(.plain)
}

#Preview("Grouped Style") {
    ContentView()
        .listStyle(.grouped)
}

#Preview("Inset Style") {
    ContentView()
        .listStyle(.inset)
}

#Preview("Inset Grouped Style") {
    ContentView()
        .listStyle(.insetGrouped)
}

#Preview("Sidebar Style") {
    ContentView()
        .listStyle(.sidebar)
}

private extension ContentView {
    @ViewBuilder
        private func backgroundView() -> some View {
            let colors: [Color] = [.green, .blue]
            LinearGradient(colors: colors,
                           startPoint: .top,
                           endPoint: .bottom)
        }
    
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, List!")
            Divider()
        }
        .font(.headline)
    }

    @ViewBuilder
    private func productView(_ product: Product) -> some View {
        HStack {
            Image(systemName: product.image)
                .symbolVariant(.square)
            Divider()
            Text(product.name)
        }
        .font(.headline)
    }

}

