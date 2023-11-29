//
//  ContentView.swift
//  Edit List In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = PlaylistViewModel()
    @State private var listSelectedItems = Set<UUID>()
    @State private var isShowingDialog = false
    @State private var selectedSong: Song?
    
    private var isListSelectedItemsEmpty: Bool {
        return self.listSelectedItems.capacity == 0
    }
    
    private let gradientColor = Color(red: 222/255, green: 201/255, blue: 106/255)
    
    var body: some View {
        NavigationView {
            ZStack {
                self.backgroundView()
                    .ignoresSafeArea()
                
                List(selection: self.$listSelectedItems) {
                    Section {
                        ForEach(self.vm.playlistOne.songs, id: \.id) { song in
                            LazyVStack(alignment: .leading) {
                                self.songView(song)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.teal.opacity(0.4))
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                self.leadingSwipeView(song)
                            }
                            .swipeActions(edge: .trailing,
                                          allowsFullSwipe: !song.isFavorite) {
                                self.trailingSwipeView(song)
                            }
                        }
                        .onMove { oldIndexSet, newIndex in
                            withAnimation {
                                self.vm.swap(from: oldIndexSet, to: newIndex)
                            }
                        }
                        .onDelete { indexSet in
                            if self.selectedSong != nil {
                                self.isShowingDialog.toggle()
                            }
                        }
                        .onChange(of: self.listSelectedItems) { uuids in
                            print("UUID: \(uuids)")
                            self.changeSelectedSong(with: uuids)
                        }
                        
                    } header: {
                        Label(
                            title: { Text("\(self.vm.playlistOne.name)") },
                            icon: { Image(systemName: "\(self.vm.playlistOne.image)") }
                        )
                    } footer: {
                        Text("These are all the products from \(self.vm.playlistOne.name) you can choose from")
                    }
                    .headerProminence(.increased)
                    // ====================== COMPONENT SEPARATOR==============================
                    
                    if !self.vm.playlistOneFavorites.isEmpty {
                        Section {
                            ForEach(self.vm.playlistOneFavorites) { song in
                                LazyVStack(alignment: .leading) {
                                    self.songView(song)
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.teal.opacity(0.4))
                            }
                        } header: {
                            Label(
                                title: { Text("Favorite songs from \(self.vm.playlistOne.name)") },
                                icon: { Image(systemName: "\(self.vm.playlistOne.image)") }
                            )
                        } footer: {
                            Text("These are all the products from \(self.vm.playlistOne.name) you can choose from")
                        }
                        .headerProminence(.increased)
                    }
                }
                .listStyle(.insetGrouped)
                .listBackgroundColor(.clear)
            }
            .navigationBarColor(backgroundColor: self.gradientColor)
            .navigationTitle("List Example")
            .navigationBarTitleDisplayMode(.large)
            .toolbar { EditButton() }
            .confirmationDialog("Delete Song",
                                isPresented: self.$isShowingDialog,
                                titleVisibility: .visible,
                                presenting: self.selectedSong,
                                actions: { song in
                self.confirmationDeleteButton {
                    self.vm.delete(song)
                    self.selectedSong = nil
                }
                self.confirmationCancelButton()
            }, message: { song in
                Text("Are you sure you want to delete \(song.name)?")
            })
            .animation(.easeInOut, value: self.vm.playlistOne)
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
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
            Text("Hello, List!")
            Divider()
        }
    }
    
    @ViewBuilder
    private func songView(_ song: Song) -> some View {
        HStack {
            Image(systemName: song.image)
                .symbolVariant(.square)
            Divider()
            Text(song.name)
            Spacer()
            if song.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .font(.headline)
    }
    
    @ViewBuilder
    private func leadingSwipeView(_ song: Song) -> some View {
        Button {
            withAnimation {
                self.selectedSong = song
                self.vm.toggleFavorite(for: song)
            }
        } label: {
            if song.isFavorite {
                Label("Unfavorite", systemImage: "star.slash")
            } else {
                Label("Favorite", systemImage: "star")
            }
        }
        .tint(.yellow)
    }
    
    private func trailingSwipeView(_ song: Song) -> some View {
        Button(role: .destructive) {
            withAnimation {
                self.selectedSong = song
                self.isShowingDialog.toggle()
            }
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
    
    @ViewBuilder
    private func confirmationDeleteButton(action:
                                          (@escaping () -> Void) = {}) -> some View {
        Button(role: .destructive) {
            withAnimation {
                action()
            }
        } label: {
            Text("Delete")
        }
    }
    
    @ViewBuilder
    private func confirmationCancelButton(action:
                                          (@escaping () -> Void) = {}) -> some View {
        Button(role: .cancel) {
            withAnimation {
                action()
            }
        } label: {
            Text("Cancel")
        }
    }
}

private extension ContentView {
    private func changeSelectedSong(with uuids: Set<UUID>) -> Void {
        for uuid in uuids {
            let tempSong = self.vm.playlistOne.songs.first(where: { $0.id == uuid})
            
            withAnimation {
                self.selectedSong = tempSong
            }
        }
    }
}

