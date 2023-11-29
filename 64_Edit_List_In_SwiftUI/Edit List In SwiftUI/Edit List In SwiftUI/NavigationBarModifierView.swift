//
//  NavigationBarModifierView.swift
//  Edit List In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

struct NavigationBarModifierView: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: Color?, titleColor: UIColor?) {
        self.backgroundColor = UIColor(backgroundColor ?? .clear)
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithDefaultBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor ?? .accentColor)
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = titleColor
    }

    func body(content: Content) -> some View { return content }
}

extension View {
    func navigationBarColor(backgroundColor: Color? = nil, titleColor: UIColor? = nil) -> some View {
        self.modifier(NavigationBarModifierView(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}
