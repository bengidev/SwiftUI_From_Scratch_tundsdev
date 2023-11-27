//
//  TermsAgreementView.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct TermsAgreementView: View {
    @Binding var isShowingTerms: Bool
    @Binding var hasAcceptedTerms: Bool
    
    var body: some View {
        VStack {
            self.titleText()
            self.contentView()
            self.agreeTermsButton() {
                withAnimation {
                    self.isShowingTerms.toggle()
                    self.hasAcceptedTerms = true
                }
            }
        }
    }
}

#Preview {
    TermsAgreementView(isShowingTerms: .constant(false),
                       hasAcceptedTerms: .constant(false))
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
                LazyVStack {
                    Label(
                        title: { Text(item).italic() },
                        icon: { Image(systemName: "\(index + 1).circle") }
                    )
                }
            }
        }
        .listStyle(.plain)
    }
    
    private func agreeTermsButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(action: action) {
            Label(
                title: { Text("Terms And Conditions").font(.headline) },
                icon: { Image(systemName: "rectangle.and.pencil.and.ellipsis") }
            )
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
    }
    
}

