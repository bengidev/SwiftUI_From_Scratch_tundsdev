//
//  ScrollViewEditor.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import UIKit

final class ScrollViewEditor {
    static func enableScrollBehavior() -> Void {
        UIScrollView.appearance().isScrollEnabled = true
    }
    
    static func disableScrollBehavior() -> Void {
        UIScrollView.appearance().isScrollEnabled = false
    }
}
