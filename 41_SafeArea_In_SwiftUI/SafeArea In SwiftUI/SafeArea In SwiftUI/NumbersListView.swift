//
//  NumbersListView.swift
//  SafeArea In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct NumbersListView: View {
    var body: some View {
        NavigationView {
            List(0...20, id: \.self) { item in
                Text("Number \(item)")
            }
            .navigationTitle("Numbers")
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                self.plusButton()
                    .padding(.trailing)
            }
            .safeAreaInset(edge: .leading, alignment: .bottom) {
                self.sideBar()
            }
        }
    }
}

#Preview {
    NumbersListView()
}

extension NumbersListView {
    private func plusButton() -> some View {
        return Button {
            
        } label: {
            Image(systemName: "plus")
                .symbolVariant(.circle.fill)
                .font(.system(size: 44.0,
                              weight: .bold,
                              design: .rounded))
        }
    }
    
    private func sideBar() -> some View {
        return VStack(alignment: .leading) {
            ForEach(["Home", "Features", "My Profile", "Settings"], id: \.self) { item in
                Text("\(item)")
                    .bold()
                    .padding()
            }
        }
    }
}
