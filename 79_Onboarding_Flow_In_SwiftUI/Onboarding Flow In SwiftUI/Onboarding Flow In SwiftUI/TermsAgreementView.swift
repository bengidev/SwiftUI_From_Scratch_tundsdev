//
//  TermsAgreementView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct TermsAgreementView: View {
    var agreeTermsAction: (() -> Void) = {}
    
    var body: some View {
        VStack {
            self.termsTitleView()
            self.termsContentView()
            self.agreeTermsButton(action: self.agreeTermsAction)
        }
        .padding(.top)
    }
}

struct TermsAgreementView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAgreementView()
    }
}

private extension TermsAgreementView {
    @ViewBuilder
    private func termsTitleView() -> some View {
        Text("Terms and Conditions")
            .font(
                .system(.largeTitle, design: .rounded)
                .bold()
            )
            .padding(.bottom, 8)
    }
    
    @ViewBuilder
    private func termsContentView() -> some View {
        ScrollView {
            
            ForEach(Array(repeating: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra vitae congue eu consequat ac. Amet mauris commodo quis imperdiet massa. Quis varius quam quisque id diam. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Non pulvinar neque laoreet suspendisse interdum consectetur. Pellentesque massa placerat duis ultricies lacus. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Proin fermentum leo vel orci. Sagittis eu volutpat odio facilisis mauris. Ultrices neque ornare aenean euismod. Augue ut lectus arcu bibendum. Viverra maecenas accumsan lacus vel facilisis volutpat. Pretium aenean pharetra magna ac placerat vestibulum lectus mauris. Ullamcorper malesuada proin libero nunc consequat. Sagittis purus sit amet volutpat consequat.", count: 5), id: \.self) { item in
                Text(item)
                    .italic()
            }
            .padding()
            
        }
    }
    
    @ViewBuilder
    private func agreeTermsButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Text("Agree to terms")
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding(.vertical, 10)
    }
}
