//
//  LaunchScreenView.swift
//  LaunchScreen In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    @State private var firstPhaseAnimated: Bool = false
    @State private var secondPhaseAnimated: Bool = false
    
    private let timer = Timer.publish(every: 0.65,
                                      on: .main,
                                      in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            self.backgroundView()
            self.logoView()
        }
        .onReceive(self.timer) { _ in
            self.decideManagerState()
        }
        .opacity(self.secondPhaseAnimated ? 0.0 : 1.0)
    }
}

#Preview {
    LaunchScreenView()
        .environmentObject(LaunchScreenManager())
}

extension LaunchScreenView {
    private func backgroundView() -> some View {
        return Color("launch-screen-background")
            .ignoresSafeArea()
    }
    
    private func logoView() -> some View {
        return Image("logo-white")
            .scaleEffect(self.firstPhaseAnimated ?
                         0.6 :
                            1.0)
            .scaleEffect(self.secondPhaseAnimated ?
                         UIScreen.main.bounds.height / 4 :
                            1.0)
    }
    
    private func decideManagerState() -> Void {
        switch self.launchScreenManager.state {
        case .first:
            // First phase with continuous scaling
            //
            withAnimation(.spring) {
                self.firstPhaseAnimated.toggle()
            }
        case .second:
            // Second phase with continuous scaling
            //
            withAnimation(.easeInOut) {
                self.secondPhaseAnimated.toggle()
            }
        default:
            break
        }
    }
    
}
