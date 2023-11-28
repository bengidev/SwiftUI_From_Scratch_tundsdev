//
//  InboxItem.swift
//  Swipe Actions On List
//
//  Created by Bambang Tri Rahmat Doni on 28/11/23.
//

import Foundation

struct InboxItem: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let body: String
    let dateReceived: Date
    let hasAttached: Bool
    let isFlagged: Bool
    let isReaded: Bool
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: dateReceived)
    }
}

extension InboxItem {
    static let empty = InboxItem(title: "Unknown",
                                 subtitle: "Unknown",
                                 body: "Unknown",
                                 dateReceived: .now,
                                 hasAttached: false,
                                 isFlagged: false,
                                 isReaded: false)
    
    static let examples: [InboxItem] = [
        InboxItem(title: "Email #1",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627924568),
                  hasAttached: true,
                  isFlagged: false,
                  isReaded: false),
        InboxItem(title: "Email #2",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627925568),
                  hasAttached: true,
                  isFlagged: true,
                  isReaded: true),
        InboxItem(title: "Email #3",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627924569),
                  hasAttached: false,
                  isFlagged: false,
                  isReaded: true),
        InboxItem(title: "Email #4",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627935568),
                  hasAttached: true,
                  isFlagged: false,
                  isReaded: true),
        InboxItem(title: "Email #5",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627964568),
                  hasAttached: false,
                  isFlagged: false,
                  isReaded: false),
        InboxItem(title: "Email #6",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627978568),
                  hasAttached: false,
                  isFlagged: false,
                  isReaded: false),
        InboxItem(title: "Email #7",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627994568),
                  hasAttached: false,
                  isFlagged: false,
                  isReaded: false) ,
        InboxItem(title: "Email #8",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  dateReceived: Date(timeIntervalSince1970: 1627934568),
                  hasAttached: false,
                  isFlagged: false,
                  isReaded: false)
    ]
}
