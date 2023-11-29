//
//  PopupViewModifier.swift
//  Custom PopUp In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import SwiftUI

struct PopupViewModifier: ViewModifier {
    @ObservedObject var vm: SheetViewModel
    
    let animation: Animation?
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if case let SheetViewModel.Action.present(config) = self.vm.stateAction {
                    PopupView(vm: self.vm, config: config) {
                        withAnimation(animation == nil ? .easeInOut : animation) {
                            self.vm.dismiss()
                        }
                    }
                }
            }
            .ignoresSafeArea()
    }
}

extension View {
    func popupDialog(_ vm: SheetViewModel, with animation: Animation? = nil) -> some View {
        self.modifier(PopupViewModifier(vm: vm, animation: animation))
    }
}
