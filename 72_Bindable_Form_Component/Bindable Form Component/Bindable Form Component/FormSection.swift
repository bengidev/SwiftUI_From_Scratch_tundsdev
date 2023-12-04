//
//  FormSection.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import Foundation

struct FormSection: Hashable, Identifiable {
    let id = UUID()
    let key: Key
    var header: String? = nil
    var footer: String? = nil
    var items: [FormItem]
}

extension FormSection {
    enum Key: String, Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case general
        case submission
        case marketing
        case login
    }
}
