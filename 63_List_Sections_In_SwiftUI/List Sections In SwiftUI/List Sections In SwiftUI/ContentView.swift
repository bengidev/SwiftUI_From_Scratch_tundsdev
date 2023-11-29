//
//  ContentView.swift
//  List Sections In SwiftUI
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
    
    private var favorites = (1...5).map { Product(
        name: "Favorite for number \($0.description)",
        image: $0.description)
    }
    
    private var items = (1...5).map { Product(
        name: "Product for number \($0.description)",
        image: $0.description)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                self.backgroundView()
                    .ignoresSafeArea()
                
                List(selection: self.$seledtedItems) {
                    Section("My favorite products") {
                        ForEach(self.favorites) { item in
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
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    Section {
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
                    } header: {
                        Label(
                            title: { Text("Products") },
                            icon: { Image(systemName: "basket.fill") }
                        )
                        .font(.headline)
                    } footer: {
                        Text("These are all the products you can choose from")
                    }
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    ForEach(self.favorites) { favorite in
                        Section {
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
                        } header: {
                            Label(
                                title: { Text("\(favorite.name)") },
                                icon: { Image(systemName: "basket.fill") }
                            )
                        } footer: {
                            Text("These are all the products from \(favorite.name) you can choose from")
                        }
                        .headerProminence(.increased)
                    }
                }
                .listStyle(.insetGrouped)
                .listBackgroundColor(.clear)
            }
            .navigationTitle("List Example")
            .navigationBarTitleDisplayMode(.large)
            .toolbar { EditButton() }
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    @ViewBuilder
    private func backgroundView() -> some View {
        let colors: [Color] = [.white, .yellow]
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

