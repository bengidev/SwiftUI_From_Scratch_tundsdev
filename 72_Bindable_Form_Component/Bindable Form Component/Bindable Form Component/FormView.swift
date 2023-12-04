//
//  FormView.swift
//  Bindable Form Component
//
//  Created by Bambang Tri Rahmat Doni on 04/12/23.
//

import SwiftUI

struct FormView<Manager: IFormManager>: View {
    @ObservedObject var manager: Manager
    
    var title: String = ""
    var completedFormData: ((_ data: [FormSection]) -> Void) = { _ in }
    
    @State private var hasError: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(self.$manager.sections) { $section in
                    Section {
                        ForEach($section.items) { $item in
                            switch item.kind {
                            case .text(let config):
                                self.itemKindTextField(
                                    config: config,
                                    bind: $item.stringValue
                                )
                            case .secureText(let config):
                                self.itemKindSecureTextField(
                                    config: config,
                                    bind: $item.stringValue
                                )
                                
                            case .button(let config, let action):
                                self.itemKindButton(config: config) {
                                    action(config.triggerAction)
                                }
                            case .toggle(let config):
                                self.itemKindToggle(config: config,
                                                    bind: $item.boolValue
                                )
                            }
                        }
                    } header: {
                        if let header = section.header {
                            Text(header)
                        }
                    } footer: {
                        if let footer = section.footer {
                            Text(footer)
                        }
                    }
                }
            }
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(self.title.isEmpty)
            .onAppear {
                self.manager.load()
            }
            .onChange(of: self.manager.state) { state in
                switch state {
                case .valid:
                    self.hasError = false
                    self.completedFormData(self.manager.sections)
                case .invalid:
                    self.hasError = true
                default:
                    self.hasError = false
                }
            }
            .alert(
                "Something went wrong",
                isPresented: self.$hasError) {
                    Button("OK", role: .cancel) {
                        withAnimation {
                            self.manager.state = .unknown
                        }
                    }
                } message: {
                    Text("Please check your input fields again before submit.")
                }
        }
    }
}

#Preview {
    FormView(manager: FormManagerImpl())
}

private extension FormView {
    @ViewBuilder
    private func itemKindTextField(
        config: FormItem.Kind.TextConfig,
        bind: Binding<String>) -> some View {
            TextField(
                config.title,
                text: bind
            )
            .textContentType(config.textContentType)
            .keyboardType(config.keyboardInputType)
        }
    
    @ViewBuilder
    private func itemKindSecureTextField(
        config: FormItem.Kind.TextConfig,
        bind: Binding<String>) -> some View {
            SecureField(
                config.title,
                text: bind
            )
            .textContentType(config.textContentType)
            .keyboardType(config.keyboardInputType)
        }
    
    @ViewBuilder
    private func itemKindButton(
        config: FormItem.Kind.ButtonConfig,
        action: (@escaping () -> Void) = {}) -> some View {
            Button(config.title) {
                withAnimation {
                    action()
                }
            }
        }
    
    @ViewBuilder
    private func itemKindToggle(
        config: FormItem.Kind.ToggleConfig,
        bind: Binding<Bool>) -> some View {
            Toggle(config.title, isOn: bind)
        }
}

