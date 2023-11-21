//
//  ContentView.swift
//  MultiLine TextField With TextEditor
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                self.descriptionText()
                self.textEditor()
                self.submitButton()
            }
        }
        .padding()
        .onTapGesture(perform: self.resignKeyboard)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: self.onSubmit) { Text("Done") }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func textEditor() -> some View {
        return TextEditor(text: self.$text)
            .focused(self.$isFocused)
            .frame(height: 250.0)
            .overlay {
                RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 4.0)
            }
    }
    
    private func descriptionText() -> some View {
        return Text("Description")
            .bold()
    }
    
    private func submitButton() -> some View {
        return Button(action: self.onSubmit) { Text("Submit") }
            .tint(.yellow)
            .foregroundStyle(.black)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.regular)
            .padding(.top, 30)
    }
}

extension ContentView {
    private func onSubmit() -> Void {
        print("Submitted text value: \(self.text)")
        
        self.resignKeyboard()
    }
}

extension ContentView {
    private func resignKeyboard() -> Void {
        if #available(iOS 15.0, *) {
            self.isFocused = false
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
