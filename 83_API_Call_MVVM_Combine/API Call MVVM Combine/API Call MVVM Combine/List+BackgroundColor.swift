//
//  List+BackgroundColor.swift
//  API Call MVVM Combine
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import SwiftUI

extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { }

        // default separators use same color as background
        // so to have it same but new (say red) it can be
        // used as below, otherwise we just need custom separators
        //
        // set { super.backgroundColor = .red }

    }
}

extension View {
    func listBackgroundColor(_ color: Color = .clear) -> some View {
        self.onAppear {
            UICollectionView.appearance().backgroundColor = UIColor(color)
        }
    }
}



