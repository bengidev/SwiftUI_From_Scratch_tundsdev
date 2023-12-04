//
//  FormManagerImpl.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import Foundation

final class FormManagerImpl: IFormManager {
    @Published var sections: [FormSection] = []
    @Published var state: FormState = .unknown
    
    func load() {
        let title = FormItem(
            key: .title,
            kind: .text(
                config: .init(
                    title: "Title",
                    keyboardInputType: .default,
                    textContentType: .namePrefix)),
            stringValue: "")
        let firstName = FormItem(
            key: .firstName,
            kind: .text(config: .init(
                title: "First Name",
                keyboardInputType: .namePhonePad,
                textContentType: .name)),
            stringValue: "")
        let lastName = FormItem(
            key: .lastName,
            kind: .text(config: .init(
                title: "Last Name",
                keyboardInputType: .namePhonePad,
                textContentType: .name)),
            stringValue: "")
        let generalInfoSection = FormSection(
            key: .general,
            header: "General",
            footer: "Please enter the relevant information",
            items: [title, firstName, lastName]
        )
        
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
        
        self.sections = [
            generalInfoSection,
            submitSection,
            marketingSection
        ]
    }
}

private extension FormManagerImpl {
    func validate() -> Void {
        guard let section = sections.first(where: { $0.key == .general }) else { return }
        let hasMissingData = section.items.first(where: { $0.stringValue.isEmpty }) != nil
        
        self.state = hasMissingData ? .invalid : .valid
    }
}

