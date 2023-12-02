//
//  EmptySearchView.swift
//  Search Bar In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

struct EmptySearchView: View {
    @EnvironmentObject var vm: PeopleViewModel
    
    @Binding var query: String
    
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        VStack {
            Label(
                title: { Text("Attention") },
                icon: { Image(systemName: "mail.and.text.magnifyingglass") }
            )
            .font(.title2.bold())
            Divider()
            
            Group {
                Text("Sorry, we couldn't find: ") +
                Text("\(self.query)").bold() +
                Text(" from our available data. Please input the different keyword.")
            }
            .padding(.bottom, 10.0)

            Button("Clear Search") {
                withAnimation {
                    self.dismissSearch()
                    self.query = ""
                    self.vm.search()
                }
            }
            
            .padding([.vertical, .horizontal], 10.0)
            .background(Material.ultraThick,
                        in: RoundedRectangle(cornerRadius: 15.0))
        }
        .padding([.vertical, .horizontal], 15.0)
        .background(Material.ultraThin,
                    in: RoundedRectangle(cornerRadius: 15.0))
        .padding()
    }
}

#Preview {
    EmptySearchView(query: .constant("Test"))
}
