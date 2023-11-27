//
//  ContentView.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetShowed: Bool = false
    @State private var isFullScreenShowed: Bool = false
    @State private var isPopOverShowed: Bool = false
    @State private var isTermsAgreementShowed: Bool = false
    @State private var hasAcceptedTermsAgreement: Bool = false
    
    var body: some View {
        VStack {
            self.helloView()
            
            VStack {
                self.showSheetButton() {
                    withAnimation {
                        self.isSheetShowed.toggle()
                    }
                }
                self.showFullScreenButton() {
                    withAnimation {
                        self.isFullScreenShowed.toggle()
                    }
                }
                self.showPopOverButton {
                    withAnimation {
                        self.isPopOverShowed.toggle()
                    }
                }
                self.showTermsAgreementButton {
                    withAnimation {
                        self.isTermsAgreementShowed.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: self.$isSheetShowed, 
               onDismiss: self.sheetOnDismiss) {
            WarningView()
        }
        .fullScreenCover(isPresented: self.$isFullScreenShowed,
                         onDismiss: self.fullScreenOnDismiss) {
            WarningView()
        }
        .popover(isPresented: self.$isPopOverShowed,
                 attachmentAnchor: .point(.top),
                 arrowEdge: .top) {
            WarningView()
        }
        .sheet(isPresented: self.$isTermsAgreementShowed) {
            TermsAgreementView(isShowingTerms: self.$isTermsAgreementShowed,
                               hasAcceptedTerms: self.$hasAcceptedTermsAgreement)
            .interactiveDismissDisabled(!self.hasAcceptedTermsAgreement)
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    private func helloView() -> some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Divider()
        }
        .font(.headline)
        .padding(.bottom, 20.0)
    }
    
    private func showSheetButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Show Sheet",
                      systemImage: "hand.tap",
                      action: action)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
        .font(.headline)
    }
    
    private func showFullScreenButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Show FullScreen",
                      systemImage: "hand.tap",
                      action: action)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
        .font(.headline)
    }
    
    private func showPopOverButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Show PopOver",
                      systemImage: "hand.tap",
                      action: action)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
        .font(.headline)
    }
    
    private func showTermsAgreementButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Show Terms And Conditions",
                      systemImage: "hand.tap",
                      action: action)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
        .font(.headline)
    }
}

private extension ContentView {
    private func sheetOnDismiss() -> Void {
        print("Sheet was dismissed!")
    }
    
    private func fullScreenOnDismiss() -> Void {
        print("Full Screen was dismissed!")
    }
}


