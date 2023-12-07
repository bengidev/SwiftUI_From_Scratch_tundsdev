//
//  Screens.swift
//  NavigationView And NavigationLink
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import Foundation

enum Screens: Hashable, Identifiable, CaseIterable {
    var id: Self { return self }
    case marketingOptions
    case submitMarketingOptions
    case appVersion
}
