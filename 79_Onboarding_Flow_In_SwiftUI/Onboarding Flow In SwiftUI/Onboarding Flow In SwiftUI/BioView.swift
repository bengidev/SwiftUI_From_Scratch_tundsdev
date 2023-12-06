//
//  BioView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct BioView: View {
    @Binding var textEditor: String
    
    var registerAction: (() -> Void) = {}
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            self.bioLogoView()
            self.bioContentView()
            self.registerButton(action: self.registerAction)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    self.isFocused = false
                }
            }
        }
    }
}

struct BioView_Previews: PreviewProvider {
    static var previews: some View {
        BioView(textEditor: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
            .background(.blue)
    }
}

private extension BioView {
    @ViewBuilder
    private func bioLogoView() -> some View {
        Text("✍️")
            .font(.system(size: 100))
    }
    
    @ViewBuilder
    private func bioContentView() -> some View {
        VStack {
            Text("Bio")
                .font(.system(size: 30,
                              weight: .bold,
                              design: .rounded))
                .foregroundColor(.white)
            
            TextEditor(text: self.$textEditor)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 10,
                        style: .continuous
                    )
                )
                .padding()
                .focused(self.$isFocused)
        }
    }
    
    @ViewBuilder
    private func registerButton(action: (@escaping () -> Void) = {}) -> some View {
        Button {
            self.isFocused = false
            action()
        } label: {
            Text("Register")
        }
        .buttonStyle(.appStyle)
        .padding(.vertical, 20)
    }
}

