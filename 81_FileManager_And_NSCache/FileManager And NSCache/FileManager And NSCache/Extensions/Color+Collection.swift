//
//  Color+Collection.swift
//  FileManager And NSCache
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
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

