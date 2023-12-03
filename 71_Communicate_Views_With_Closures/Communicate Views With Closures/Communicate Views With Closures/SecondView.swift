//
//  SecondView.swift
//  Communicate Views With Closures
//
//  Created by Bambang Tri Rahmat Doni on 03/12/23.
//

import SwiftUI

struct SecondView: View {
    typealias EmptyAction = (() -> Void)
    typealias DefaultAction = ((Action) -> Void)
    
    var emptyAction: EmptyAction = { }
    var defaultAction: DefaultAction = { _ in }
    
    var body: some View {
        VStack {
            self.helloView()
            self.tapMeButton(action: emptyAction)
            self.toggleColorButton(action: defaultAction)
            self.toggleScaleButton(action: defaultAction)
        }
        .padding()
        .background(
            Material.ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 15.0)
        )
        .padding()
    }
}

#Preview {
    SecondView()
}

private extension SecondView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Second View!")
        }
        .font(.headline)
        .padding()
        .background(
            Material.ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 15.0)
        )
        .padding()
    }
    
    @ViewBuilder
    private func tapMeButton(action: @escaping (() -> Void) = {}) -> some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Label(
                title: { Text("Tap Me") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    @ViewBuilder
    private func toggleColorButton(action: @escaping ((Action) -> Void) = 
                                   { _ in}) -> some View {
        Button {
            withAnimation {
                action(.color)
            }
        } label: {
            Label(
                title: { Text("Toggle Color") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    @ViewBuilder
    private func toggleScaleButton(action: @escaping ((Action) -> Void) = 
                                   { _ in }) -> some View {
        Button {
            withAnimation {
                action(.scale)
            }
        } label: {
            Label(
                title: { Text("Toggle Scale") },
                icon: { Image(systemName: "hand.tap.fill") }
            )
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

extension SecondView {
    enum Action: Hashable {
        case color
        case scale
    }
}

