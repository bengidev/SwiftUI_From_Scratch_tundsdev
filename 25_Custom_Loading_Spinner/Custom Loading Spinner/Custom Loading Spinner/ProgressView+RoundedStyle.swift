//
//  ProgressView+RoundedStyle.swift
//  Custom Loading Spinner
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct RoundedProgressViewStyle: ProgressViewStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding()
            .tint(foregroundColor)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

extension ProgressViewStyle where Self == RoundedProgressViewStyle {
    static func rounded(backgroundColor: Color = .gray, 
                        foregroundColor: Color = .white) -> RoundedProgressViewStyle {
        return RoundedProgressViewStyle(backgroundColor: backgroundColor, 
                                        foregroundColor: foregroundColor)
    }
}
