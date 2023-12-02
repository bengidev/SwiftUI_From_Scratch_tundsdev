//
//  ContentView.swift
//  Search Bar In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var query: String
    
    @EnvironmentObject var vm: PeopleViewModel
    
    @State private var selectedItems = Set<UUID>()
    
    private let gradientColor = Color(red: 222/255, green: 201/255, blue: 106/255)
    
    var body: some View {
        NavigationView {
            ZStack {
                self.backgroundView()
                    .ignoresSafeArea()
                List(selection: self.$selectedItems) {
                    ForEach(self.vm.filteredData) { person in
                        LazyVStack {
                            HStack {
                                Text(person.gender.rawValue)
                                Divider()
                                Text(person.name)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.teal.opacity(0.4))
                    }
                }
                .listBackgroundColor()
                .searchable(text: self.$query,
                            placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "Find a person") {
                    if self.vm.filteredData.isEmpty,
                       let randomName = self.vm.data.randomElement()?.name {
                        Text("Maybe you're looking for \(randomName)?")
                            .searchCompletion(randomName)
                    }
                }
            }
            .navigationTitle("People")
            .navigationBarColor(backgroundColor: self.gradientColor, titleColor: .black)
        }
        .animation(.easeInOut, value: self.vm.filteredData)
        .onSubmit(of: .search) {
            self.vm.search(with: self.query)
        }
        .onAppear {
            self.vm.search()
        }
        .overlay {
            if self.vm.filteredData.isEmpty {
                EmptySearchView(query: self.$query)
            }
        }
    }
}

#Preview {
    ContentView(query: .constant(""))
        .environmentObject(PeopleViewModel())
}

extension ContentView {
    @ViewBuilder
    private func backgroundView() -> some View {
        let colors: [Color] = [.yellow, .teal]
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
            Text("Hello, world!")
            Divider()
        }
        .font(.headline)
    }
    
}
