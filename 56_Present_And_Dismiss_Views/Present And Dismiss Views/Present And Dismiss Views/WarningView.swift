//
//  WarningView.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct WarningView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            self.backgroundGradient()
            
            VStack {
                self.warningImage()
                self.titleText()
                self.contentText()
            }
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
        }
        .overlay(alignment: .topTrailing) {
            self.closeButton() {
                withAnimation {
                    if #available(iOS 15.0, *) {
                        self.dismiss.callAsFunction()
                    } else {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WarningView()
}

private extension WarningView {
    private func backgroundGradient() -> some View {
        let colors: [Color] = [.red, .black, .blue]
        
        return LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
    }
    
    private func closeButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button(action: action) {
            Image(systemName: "xmark.circle")
                .symbolVariant(.fill)
                .foregroundStyle(Color.white)
                .font(.title.bold())
        }
        .padding([.top, .trailing])
    }
    
    private func warningImage() -> some View {
        return Image(systemName: "exclamationmark.triangle")
            .symbolRenderingMode(.multicolor)
            .font(.system(size: 40.0, weight: .bold, design: .rounded))
    }
    
    private func titleText() -> some View {
        return Text("Warning!")
            .font(.system(.largeTitle, design: .rounded).bold())
            .bold()
            .padding(.bottom, 10.0)
    }
    
    private func contentText() -> some View {
        let text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        
        return Text(text)
            .font(.footnote)
            .frame(maxWidth: 300.0)
    }
    
}
