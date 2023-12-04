//
//  FormState.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import Foundation

enum FormState: Hashable, Identifiable, CaseIterable {
    var id: Self { return self }
    case valid
    case invalid
    case unknown
}
