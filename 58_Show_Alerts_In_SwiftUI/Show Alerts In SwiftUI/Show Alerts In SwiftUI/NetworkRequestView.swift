//
//  NetworkRequestView.swift
//  Show Alerts In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct NetworkRequestView: View {
    @StateObject private var viewModel = NetworkManagerViewModel()
    @State private var notUrl: String = ""

    var body: some View {
        ZStack {
            Color.teal
            
            VStack {
                self.titleView()
                self.fileNameView()
                self.processRequestButton() {
                    withAnimation {
                        self.viewModel.fetchNetwork()
                    }
                }
                
            }
            .padding()
            .background(Material.ultraThickMaterial,
                        in: RoundedRectangle(cornerRadius: 12.0))
            .padding(.horizontal, 10.0)
        }
        .ignoresSafeArea()
        .alert(isPresented: self.$viewModel.hasError,
               error: self.viewModel.error) { error in
            Button(error.suggestion) { self.viewModel.fetchNetwork() }
            Button("Cancel", role: .cancel, action: {})
        } message: { error in
            Text(error.message)
        }
        
        
    }
}

#Preview {
    NetworkRequestView()
}

private extension NetworkRequestView {
    private func titleView() -> some View {
        return VStack {
            Text("Network Request")
                .font(.system(.title, design: .rounded))
                .bold()
            Divider()
        }
    }
    
    private func fileNameView() -> some View {
        return HStack {
            Label(
                title: { Text("URL").font(.headline) },
                icon: { Image(systemName: "network") }
            )
            TextField("", text: self.$notUrl)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.vertical, 10.0)
    }
    
    private func processRequestButton(action: (@escaping () -> Void) = {}) -> some View {
        return Group {
            if self.viewModel.isLoading {
                ProgressView()
            } else {
                Button("Process Request",
                       systemImage: "icloud.and.arrow.up",
                       action: action)
                .font(.headline)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .padding(.top, 30.0)
            }
        }
    }
}

