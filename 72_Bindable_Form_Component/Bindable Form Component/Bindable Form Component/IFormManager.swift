//
//  IFormManager.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import Foundation

protocol IFormManager: ObservableObject {
    var sections: [FormSection] { get set }
    var state: FormState { get set }
    func load() -> Void
}
