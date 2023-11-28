//
//  MessagesViewModel.swift
//  Swipe Actions On List
//
//  Created by Bambang Tri Rahmat Doni on 28/11/23.
//

import Foundation

final class MessagesViewModel: ObservableObject {
    @Published private(set) var data: [InboxItem] = InboxItem.examples
    
    func toggleReadStatus(for item: InboxItem) -> Void {
        for (index, inbox) in data.enumerated() where inbox.id == item.id {
            let newInbox = InboxItem(title: item.title,
                                     subtitle: item.subtitle,
                                     body: item.body,
                                     dateReceived: item.dateReceived,
                                     hasAttached: item.hasAttached,
                                     isFlagged: item.isFlagged,
                                     isReaded: !item.isReaded)
            
            DispatchQueue.main.async {
                self.data[index] = newInbox
            }
        }
    }
    
    func toggleFlagStatus(for item: InboxItem) -> Void {
        for (index, inbox) in data.enumerated() where inbox.id == item.id {
            let newInbox = InboxItem(title: item.title,
                                     subtitle: item.subtitle,
                                     body: item.body,
                                     dateReceived: item.dateReceived,
                                     hasAttached: item.hasAttached,
                                     isFlagged: !item.isFlagged,
                                     isReaded: item.isReaded)
            
            DispatchQueue.main.async {
                self.data[index] = newInbox
            }
        }
    }
    
    func delete(_ item: InboxItem) -> Void {
        guard !self.data.isEmpty else { return }
        
        DispatchQueue.main.async { [unowned self] in
            for (index, inbox) in self.data.enumerated() where inbox.id == item.id {
                self.data.remove(at: index)
            }
        }
    }
    
    func delete(_ indexSet: IndexSet) -> Void {
        DispatchQueue.main.async {
            self.data.remove(atOffsets: indexSet)
        }
    }
    
    func swap(oldIndexSet: IndexSet, newIndex: Int) -> Void {
        DispatchQueue.main.async {
            self.data.move(fromOffsets: oldIndexSet, toOffset: newIndex)
        }
    }
    
    func deleteAll() -> Void {
        DispatchQueue.main.async {
            self.data.removeAll()
        }
    }
}
