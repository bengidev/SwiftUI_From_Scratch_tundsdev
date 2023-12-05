//
//  UserDefaultsExtensions.swift
//  AppStorage And UserDefaults
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import Foundation

extension UserDefaults {
    var isEnablingLight: Bool {
        get {
            object(forKey: "isEnablingLight") as? Bool ?? false
        }
        set {
            set(newValue, forKey: "isEnablingLight")
        }
    }
}
