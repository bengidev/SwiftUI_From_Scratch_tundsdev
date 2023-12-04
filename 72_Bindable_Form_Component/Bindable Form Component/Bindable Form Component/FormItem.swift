//
//  FormItem.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import UIKit

struct FormItem: Hashable, Identifiable {
    let id = UUID()
    let key: Key
    let kind: Kind
    var stringValue: String = ""
    var boolValue: Bool = false
}

extension FormItem {
    enum Kind: Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case text(config: TextConfig)
        case button(config: ButtonConfig, action: (ButtonConfig.Action) -> Void)
        case toggle(config: ToggleConfig)
        case secureText(config: TextConfig)
        
        static var allCases: [FormItem.Kind] {
            return [
                .text(config: .standard),
                .button(config: .standard, action: { _ in }),
                .toggle(config: .standard),
                .secureText(config: .standard)
            ]
        }
        
        static func == (lhs: FormItem.Kind, rhs: FormItem.Kind) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    }
}

extension FormItem.Kind {
    struct TextConfig {
        let title: String
        let keyboardInputType: UIKeyboardType
        let textContentType: UITextContentType
        
        static let standard: TextConfig = .init(
            title: "",
            keyboardInputType: .namePhonePad,
            textContentType: .name
        )
    }
    
    struct ButtonConfig {
        let title: String
        let triggerAction: Action
        
        static let standard: ButtonConfig = .init(
            title: "Tap Here",
            triggerAction: .submit
        )
    }
    
    struct ToggleConfig {
        let title: String
        
        static let standard: ToggleConfig = .init(
            title: "Default"
        )
    }
}

extension FormItem.Kind.ButtonConfig {
    enum Action: Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case submit
    }
}

extension FormItem {
    enum Key: String, Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case title
        case firstName
        case lastName
        case submit
        case sendMarketing
        case username
        case password
    }
}
