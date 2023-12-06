//
//  UsernameView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct UsernameView: View {
    @Binding var text: String
    
    var nextAction: (() -> Void) = {}
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            self.usernameLogoView()
            self.usernameContentView()
            self.nextButton(action: self.nextAction)
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

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView(text: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
            .background(.blue)
    }
}

private extension UsernameView {
    @ViewBuilder
    private func usernameLogoView() -> some View {
        Text("👥")
            .font(.system(size: 100))
    }
    
    @ViewBuilder
    private func usernameContentView() -> some View {
        VStack {
            Text("Username")
                .font(.system(size: 30,
                              weight: .bold,
                              design: .rounded))
                .foregroundColor(.white)
            
            TextField("Please enter a username", text: self.$text)
                .padding()
                .frame(width: 350, height: 50)
                .background(.white, in: RoundedRectangle(cornerRadius: 10,
                                                         style: .continuous))
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .padding(.bottom, 8)
                .focused(self.$isFocused)
        }
    }
    
    @ViewBuilder
    private func nextButton(action: (@escaping () -> Void) = {}) -> some View {
        Button {
            self.isFocused = false
            action()
        } label: {
            Text("Next")
        }
        .buttonStyle(.appStyle)
        .padding(.top, 20)
    }
}
