//
//  InboxItemView.swift
//  Swipe Actions On List
//
//  Created by Bambang Tri Rahmat Doni on 28/11/23.
//

import SwiftUI

struct InboxItemView: View {
    let item: InboxItem
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack {
                    self.itemReadView()
                    self.itemTitleView()
                }
                
                Spacer()
                self.itemDateView()
            }
            HStack {
                self.itemSubtitleView()
                Spacer()
                
                self.itemAttachedView()
                self.itemFlagView()
            }
            
            self.itemBodyView()
        }
    }
}

#Preview {
    InboxItemView(item: InboxItem.empty)
}

private extension InboxItemView {
    @ViewBuilder
    private func itemReadView() -> some View {
        if !self.item.isReaded {
            Circle()
                .frame(width: 10.0, height: 10.0)
                .foregroundStyle(Color.accentColor)
        }
    }

    @ViewBuilder
    private func itemTitleView() -> some View {
        Text(self.item.title)
            .font(.headline)
    }

    @ViewBuilder
    private func itemDateView() -> some View {
        Text(self.item.formattedDate)
            .font(.caption)
            .opacity(0.5)
    }

    @ViewBuilder
    private func itemSubtitleView() -> some View {
        Text(self.item.subtitle)
            .font(.callout)
            .lineLimit(1)
    }

    @ViewBuilder
    private func itemAttachedView() -> some View {
        if self.item.hasAttached {
            Image(systemName: "paperclip")
                .font(.system(size: 14.0, weight: .light))
                .foregroundStyle(Color.gray)
        }
    }

    @ViewBuilder
    private func itemFlagView() -> some View {
        if self.item.isFlagged {
            Image(systemName: "flag.fill")
                .font(.system(size: 14.0, weight: .bold))
                .foregroundStyle(Color.red)
        }
    }

    @ViewBuilder
    private func itemBodyView() -> some View {
        HStack(spacing: 0) {
            Text(self.item.body)
                .lineLimit(2)
                .font(.callout)
                .opacity(0.5)
            Spacer()
        }
    }

}
