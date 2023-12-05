//
//  FoodItemView.swift
//  Cache Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct FoodItemView: View {
    let item: FoodItem
    
    private let cornerRadius: CGFloat = 12
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                CachedImageView(
                    url: self.item.imgUrl,
                    animation: .bouncy,
                    transition: .scale.combined(with: .opacity)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView("Loading...")
                            .frame(width: 100.0, height: 100.0)
                            .background(Material.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                            .padding()
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding()
                    default:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                            .padding()
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding()
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                Text(item.attributedPrice)
                Text(item.desc)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.black)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        
    }
}

#Preview {
    FoodItemView(item: FoodItem.example)
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.black.opacity(0.7))
}

