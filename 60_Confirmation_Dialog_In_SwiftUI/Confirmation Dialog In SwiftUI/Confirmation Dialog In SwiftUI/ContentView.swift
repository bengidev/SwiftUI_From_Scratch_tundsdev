//
//  ContentView.swift
//  Confirmation Dialog In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MessagesViewModel()
    @State private var listSelectedItems = Set<UUID>()
    @State private var multipleSelectedItems = Set<UUID>()
    @State private var tempSelectedItems = Set<UUID>()
    @State private var isShowingConfirmation = false
    
    var body: some View {
        NavigationView {
            // Using collections of UUID for enabling the selection features of List.
            // Pass that collections of UUID into selection parameters inside List.
            //
            // Using modifiers below ForEach for enabling List features, i.e
            // swipe for delete, swipe for edit, etc.
            //
            // Add EditButton inside toolbar for enabling more List features.
            //
            List(selection: self.$listSelectedItems) {
                ForEach(self.vm.data, id: \.id) { item in
                    LazyVStack {
                        InboxItemView(item: item)
                    }
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
                .onMove { indices, newOffset in
                    withAnimation {
                        self.vm.swap(oldIndexSet: indices, newIndex: newOffset)
                    }
                }
                .onChange(of: self.listSelectedItems) { items in
                    // Check if list selected capacity is not zero,
                    // if the values was empty, do not change the temp values.
                    //
                    // Using temp values because these temp values will empty
                    // when the dialog will show.
                    //
                    // The temp values will be copied into multiple selected
                    // when user select delete after the dialog was appear.
                    //
                    
                    if items.capacity != 0 {
                        self.tempSelectedItems = items
                    }
                
                    print("Selected items: \(self.tempSelectedItems.count)")
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
                    self.toolbarDeleteAllButton {
                        // Check if selected temp values is not empty,
                        // then show confirmation dialog
                        //
                        if !self.tempSelectedItems.isEmpty {
                            self.isShowingConfirmation.toggle()
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    self.toolbarSortButton()
                    Spacer()
                    
                    self.dummyUnreadView()
                    Spacer()
                    
                    self.toolbarNewItemButton()
                }
            }
            .confirmationDialog("Delete Inbox Item",
                                isPresented: self.$isShowingConfirmation,
                                titleVisibility: .visible,
                                actions: {
                self.confirmationDeleteButton(action: self.deleteAllSelectedItems)
                self.confirmationCancelButton(action: self.resetSelectedItems)
            }, message: {
                Text("Are you sure want to delete the selected inbox items?")
            })
            .animation(.easeInOut, value: self.vm.data)
        }
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
                // Insert single selected InboxItem into multipleSelected,
                // not into tempSelected. After that, change value
                // for showing dialog into true
                //
                self.multipleSelectedItems.insert(item.id)
                self.isShowingConfirmation.toggle()
                print("Items added: \(self.multipleSelectedItems.count)")
            }
        } label: {
            Label("Delete", systemImage: "trash")
        }
        
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
    private func confirmationDeleteButton(action:
                                          (@escaping () -> Void) = {}) -> some View {
        Button(role: .destructive, action: action) {
            Text("Delete")
        }
    }
    
    @ViewBuilder
    private func confirmationCancelButton(action:
                                          (@escaping () -> Void) = {}) -> some View {
        Button(role: .cancel, action: action) {
            Text("Cancel")
        }
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
        Button(role: .destructive, action: action) {
            Text("Delete All")
        }
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
    private func deleteAllSelectedItems() -> Void {
        DispatchQueue.main.async {
            withAnimation {
                // This checking purpose was added for checking if
                // user was selected single delete from swipe,
                // and if user selected multiple delete, then
                // multiple values will copy latest temp values
                // before temp values become empty again, because
                // showing dialog will cause temp values become empty.
                //
                // Check if multiple delete selection was selected,
                // then use multiple values from temp, otherwise
                // use latest multiple values from single swipe delete
                //
                if self.multipleSelectedItems.isEmpty {
                    self.multipleSelectedItems = self.tempSelectedItems
                }
                
                // Delete all selected items after converted
                // all values from uuids into InboxItems
                //
                for itemId in self.multipleSelectedItems {
                    let items = self.vm.data.filter { $0.id == itemId }
                    for item in items {
                        self.vm.delete(item)
                    }
                }
                
                // Reset selected values into empty after delete
                //
                self.resetSelectedItems()
            }
        }
    }
    
    private func resetSelectedItems() -> Void {
        withAnimation {
            self.multipleSelectedItems = Set<UUID>()
            self.tempSelectedItems = Set<UUID>()
        }
    }
    
}
