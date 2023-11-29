//
//  SheetViewModel.swift
//  Custom PopUp In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 29/11/23.
//

import Foundation

final class SheetViewModel: ObservableObject {
    @Published private(set) var stateAction: Action = .none
    
    func present(with config: Config) -> Void {
        guard self.stateAction.isNotPresented else { return }
        
        self.stateAction = .present(info: config)
    }
    
    func dismiss() -> Void {
        self.stateAction = .dismiss
    }
}

extension SheetViewModel {
    typealias Config = SheetViewModel.Action.Info
    
    enum Action: Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case none
        case present(info: Info)
        case dismiss
        
        static var allCases: [SheetViewModel.Action] {
            return [.none, .present(info: .empty), .dismiss]
        }
        
        struct Info: Hashable, Identifiable {
            let id = UUID()
            let systemName: String
            let title: String
            let content: String
            
            static let empty = Info(systemName: "Empty", title: "Empty", content: "Empty")
        }
    }
}

extension SheetViewModel.Action {
    var isPresented: Bool {
        guard case .present(_) = self else { return false }
        return true
    }
    
    var isNotPresented: Bool {
        guard case .present(_) = self else { return true }
        return false
    }
}
