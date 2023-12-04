//
//  LoginFormManagerImpl.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import Foundation

final class LoginFormManagerImpl: IFormManager {
    @Published var sections: [FormSection] = []
    @Published var state: FormState = .unknown
    
    func load() {
        let username = FormItem(
            key: .username,
            kind: .text(config: .init(
                title: "Userame",
                keyboardInputType: .emailAddress,
                textContentType: .username)),
            stringValue: "")
        let password = FormItem(
            key: .password,
            kind: .secureText(config: .init(
                title: "Password",
                keyboardInputType: .default,
                textContentType: .password)),
            stringValue: "")
        let loginSection = FormSection(
            key: .login,
            header: "Account Details",
            footer: "Please enter your valid account details.",
            items: [username, password]
        )
        
        let marketing = FormItem(
            key: .sendMarketing,
            kind: .toggle(config: .init(
                title: "Do you want to receive marketing ads?")),
            boolValue: true
        )
        let marketingSection = FormSection(
            key: .marketing,
            header: "Marketing Preferences",
            items: [marketing])
        
        let submit = FormItem(
            key: .submit,
            kind: .button(config: .init(
                title: "Submit",
                triggerAction: .submit),
                          action: { [weak self] action in
                              dump(self?.sections)
                              self?.validate() }),
            stringValue: ""
        )
        let submitSection = FormSection(
            key: .submission,
            items: [submit]
        )
        
        self.sections = [
            loginSection,
            marketingSection,
            submitSection,
        ]
    }
}

private extension LoginFormManagerImpl {
    func validate() -> Void {
        guard let section = sections
            .first(where: { $0.key == .login })?
            .items.lazy.filter({ $0.key != .submit }) else { return }
        
        let hasMissingData = section.first(where: { $0.stringValue.isEmpty }) != nil
        
        self.state = hasMissingData ? .invalid : .valid
    }
}


