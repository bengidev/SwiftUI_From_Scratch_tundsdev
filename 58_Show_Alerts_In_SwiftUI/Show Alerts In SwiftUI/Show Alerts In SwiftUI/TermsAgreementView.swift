//
//  TermsAgreementView.swift
//  Show Alerts In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct TermsAgreementView: View {
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                self.contentView()
                self.agreeTermsButton(action: self.toggleShowAlert)
            }
            .navigationTitle("Terms And Conditions")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert("Terms And Conditions", isPresented: self.$isShowingAlert) {
            self.confirmButton(action: self.confirmAction)
            self.rejectButton(action: self.rejectAction)
            self.cancelButton(action: self.cancelAction)
        } message: {
            self.alertMessage()
        }
    }
}

#Preview {
    TermsAgreementView()
}

private extension TermsAgreementView {
    private func titleText() -> some View {
        return Text("Terms And Conditions")
            .font(.system(.largeTitle, design: .rounded))
            .bold()
            .padding([.top, .bottom], 10.0)
    }
    
    private func contentView() -> some View {
        let text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        
        let firstData = Array(repeating: text, count: 5).indices
        let secondData = Array(repeating: text, count: 5)

        return List {
            ForEach(Array(zip(firstData, secondData)), id: \.0) { index, item in
                let newIndex = index + 1
                
                Section("Number \(newIndex)") {
                    LazyVStack {
                        Label(
                            title: { Text(item).italic() },
                            icon: { Image(systemName: "\(newIndex).circle") }
                        )
                    }
                }
                
            }
        }
    }
    
    private func alertMessage() -> some View {
        let text = """
            These Terms and Conditions shall be governed by and construed in accordance with the law of and you hereby submit to the exclusive jurisdiction of the courts.
        """
        return Text(text)
            .font(.headline)
    }

    
    private func agreeTermsButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(action: action) {
            Label(
                title: { Text("Terms And Conditions") },
                icon: { Image(systemName: "rectangle.and.pencil.and.ellipsis") }
            )
        }
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
    }
    
    private func confirmButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Confirm", action: action)
    }
    
    private func cancelButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Cancel", role: .cancel, action: action)
    }
    
    private func rejectButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Reject", role: .destructive, action: action)
    }

}

private extension TermsAgreementView {
    private func toggleShowAlert() -> Void {
        withAnimation {
            self.isShowingAlert.toggle()
        }
    }

    private func confirmAction() -> Void {
        print("Confirm")
    }
    
    private func cancelAction() -> Void {
        print("Cancel")
    }
    
    private func rejectAction() -> Void {
        print("Reject")
    }
}

