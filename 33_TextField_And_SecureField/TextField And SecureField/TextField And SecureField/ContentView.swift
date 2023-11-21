//
//  ContentView.swift
//  TextField And SecureField
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var user: User = .empty
    
    @FocusState private var inputFocused: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .bold()
                .padding(.bottom, 50)
            
            // ====================== COMPONENT SEPARATOR==============================
            
            Group {
                usernameTextField
                passwordTextField
            }
            .padding(.bottom, 10)
            .focused(self.$inputFocused)
            .textFieldStyle(.roundedBorder)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            submitButton
                .padding(.top, 10)
            
            // ====================== COMPONENT SEPARATOR==============================
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: self.resignKeyboard) { Text("Done") }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private var usernameTextField: some View {
        return TextField("Username", 
                         text: self.$user.username,
                         prompt: Text("Username"))
        .textContentType(.username)
    }
    
    private var passwordTextField: some View {
        return SecureField("Password", 
                           text: self.$user.password,
                           prompt: Text("Password"))
        .textContentType(.password)
        .submitLabel(.done)
        .onSubmit(of: .text) { self.onSubmit(self.user) }
    }
    
    private var submitButton: some View {
        return Button {
            self.onSubmit(self.user)
        } label: {
            Text("Submit")
        }
        .tint(.yellow)
        .foregroundStyle(.black)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.regular)
    }

}

extension ContentView {
    private func onSubmit(_ user: User) -> Void {
        print("Submitted user detail: \(user)")
        
        self.resignKeyboard()
    }
}

extension ContentView {
    private func resignKeyboard() -> Void {
        if #available(iOS 15.0, *) {
            self.inputFocused = false
        } else {
            self.dismissKeyboard()
        }
    }
    
    private func dismissKeyboard() -> Void {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
