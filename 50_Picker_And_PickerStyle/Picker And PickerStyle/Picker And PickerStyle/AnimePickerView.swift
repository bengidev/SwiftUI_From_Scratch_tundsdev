//
//  AnimePickerView.swift
//  Picker And PickerStyle
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct AnimePickerView: View {
    @State private var selectedAnime: Anime = .none
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "hands.clap")
                    .font(.largeTitle.bold())
                Text("Hello, Anime Picker!")
                    .font(.headline)
                Divider()
                    .padding(.bottom, 30.0)
            }
            
            VStack {
                HStack {
                    Text("Selected anime: ")
                    Text("\(self.selectedAnime.title)")
                        .font(.headline)
                }
                
                Picker("Select an anime", selection: self.$selectedAnime) {
                    ForEach(Anime.allCases) { anime in
                        HStack {
                            Text(anime.title)
                                .font(.headline)
                        }
                        .tag(anime)
                    }
                }
                .pickerStyle(.automatic)
            }
        }
    }
}

#Preview {
    AnimePickerView()
}
