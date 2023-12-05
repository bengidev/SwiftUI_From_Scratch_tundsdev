//
//  Color+Collection.swift
//  Cache Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

extension Color {
    static var random: Color {
        let possibleColors: [Color] = [
            .red,
            .orange,
            .yellow,
            .green,
            .mint,
            .teal,
            .cyan,
            .blue,
            .indigo,
            .purple,
            .pink,
            .brown,
            .gray,
            .black,
            .primary,
            .secondary
        ]
        
        return possibleColors.randomElement()!
    }
}
