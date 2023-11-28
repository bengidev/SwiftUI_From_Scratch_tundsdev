//
//  ContentView.swift
//  Swipe Actions On List
//
//  Created by Bambang Tri Rahmat Doni on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MessagesViewModel()
    @State private var savedSelectedItems = Set<InboxItem>()
    @State private var selectedItemIds = Set<UUID>()
    
    var body: some View {
        NavigationView {
            List(selection: self.$selectedItemIds) {
                ForEach(self.vm.data, id: \.id) { item in
                    InboxItemView(item: item)
                        .swipeActions(allowsFullSwipe: !item.isFlagged) {
                            if item.isFlagged {
                                self.itemIsFlagView(item)
                            } else {
                                self.itemNotFlagView(item)
                            }
                        }
                        .swipeActions(edge: .leading) {
                            self.itemIsReadView(item)
                        }
                }
                .onDelete { indexSet in
                    withAnimation {
                        self.vm.delete(indexSet)
                    }
                }
                .onMove { indices, newOffset in
                    withAnimation {
                        self.vm.swap(oldIndexSet: indices, newIndex: newOffset)
                    }
                }
                .onChange(of: self.selectedItemIds) { items in
                    self.saveSelectedItems(items)
                }
            }
            .searchable(text: .constant(""), prompt: "Search")
            .listStyle(.sidebar)
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    EditButton()
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    self.toolbarDeleteAllButton(action: self.deleteAllSelectedItems)
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    self.toolbarSortButton()
                    Spacer()
                    
                    self.dummyUnreadView()
                    Spacer()
                    
                    self.toolbarNewItemButton()
                }
            }
        }
        .animation(.easeInOut, value: self.vm.data)
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    @ViewBuilder
    private func itemIsFlagView(_ item: InboxItem) -> some View {
        Button {
            withAnimation {
                self.vm.toggleFlagStatus(for: item)
            }
        } label: {
            Label("Unflag", systemImage: "flag.slash")
        }
        .tint(.red)
        
        Button {
            print("Present more")
        } label: {
            Label("More", systemImage: "ellipsis.circle")
        }
    }
    
    @ViewBuilder
    private func itemNotFlagView(_ item: InboxItem) -> some View {
        Button(role: .destructive) {
            withAnimation {
                self.vm.delete(item)
            }
        } label: {
            Label("Delete", systemImage: "trash")
        }
        .tint(.red)
        
        Button {
            withAnimation {
                self.vm.toggleFlagStatus(for: item)
            }
        } label: {
            Label("Flag", systemImage: "flag")
        }
        .tint(.red)
        
        Button {
            print("Present more")
        } label: {
            Label("More", systemImage: "ellipsis.circle")
        }
    }
    
    @ViewBuilder
    private func itemIsReadView(_ item: InboxItem) -> some View {
        Button {
            withAnimation {
                self.vm.toggleReadStatus(for: item)
            }
        } label: {
            if item.isReaded {
                Label("Unread", systemImage: "envelope.badge")
            } else {
                Label("Read", systemImage: "envelope.open")
            }
        }
        .tint(.accentColor)
    }
    
    @ViewBuilder
    private func toolbarEditButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Text("Edit")
        }
        .tint(.blue)
    }
    
    @ViewBuilder
    private func toolbarDeleteAllButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Text("Delete All")
        }
        .tint(.blue)
    }
    
    @ViewBuilder
    private func toolbarSortButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .tint(.accentColor)
        }
    }
    
    @ViewBuilder
    private func dummyUnreadView() -> some View {
        VStack {
            Text("Updated just now")
                .font(.caption)
            Text("80.000 Unread")
                .font(.footnote)
                .opacity(0.5)
        }
    }
    
    @ViewBuilder
    private func toolbarNewItemButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Image(systemName: "square.and.pencil")
                .tint(.accentColor)
        }
    }
}

private extension ContentView {
    private func saveSelectedItems(_ items: Set<UUID>) -> Void {
        DispatchQueue.main.async {
            withAnimation {
                var tempItems = Set<InboxItem>()
                
                for itemId in self.selectedItemIds {
                    let items = self.vm.data.filter { $0.id == itemId }
                    for item in items {
                        tempItems.insert(item)
                    }
                }
                
                self.savedSelectedItems = tempItems
                
                print("Selected Items ID: \(items)")
                print("Temp Items: \(tempItems.count)")
                print("Saved Selected Items: \(self.savedSelectedItems.count)")
                print("Saved Selected Items First: \(String(describing: self.savedSelectedItems.first?.id))")
            }
        }
    }
    
    private func deleteAllSelectedItems() -> Void {
        DispatchQueue.main.async {
            withAnimation {
                for itemId in self.selectedItemIds {
                    let items = self.vm.data.filter { $0.id == itemId }
                    for item in items {
                        self.vm.delete(item)
                    }
                }
                
                self.savedSelectedItems = Set()
            }
        }
    }
}
