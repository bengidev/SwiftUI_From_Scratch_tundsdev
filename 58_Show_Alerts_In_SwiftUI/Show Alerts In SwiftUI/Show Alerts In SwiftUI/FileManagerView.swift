//
//  FileManagerView.swift
//  Show Alerts In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import SwiftUI

struct FileManagerView: View {
    @State private var isShowingAlert: Bool = false
    @State private var fileName: String = ""
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.7)
            
            VStack {
                self.titleView()
                self.fileNameView()
                self.removeFileButton() {
                    withAnimation {
                        self.isShowingAlert.toggle()
                    }
                }
            }
            .padding()
            .background(Material.ultraThickMaterial,
                        in: RoundedRectangle(cornerRadius: 12.0))
            .padding(.horizontal, 10.0)
        }
        .ignoresSafeArea()
        .alert("Remove File", isPresented: self.$isShowingAlert, presenting: self.fileName) { file in
            self.removeButton(with: file)
        } message: { file in
            self.alertMessageText(with: file)
        }
        
    }
}

#Preview {
    FileManagerView()
}

private extension FileManagerView {
    private func titleView() -> some View {
        return VStack {
            Text("File Manager")
                .font(.system(.title, design: .rounded))
                .bold()
            Divider()
        }
    }
    
    private func fileNameView() -> some View {
        return HStack {
            Label(
                title: { Text("File Name").font(.headline) },
                icon: { Image(systemName: "questionmark.folder") }
            )
            TextField("", text: self.$fileName)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.vertical, 10.0)
    }
    
    private func removeFileButton(action: (@escaping () -> Void) = {}) -> some View {
        return Button("Remove File", systemImage: "trash.slash", action: action)
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding(.top, 30.0)
    }
    
    private func alertMessageText(with value: String = "") -> some View {
        return Text("You are currently planning on removing \(value). " +
        "Are you sure?")
    }
    
    private func removeButton(with value: String = "",
                              action: (@escaping () -> Void) = {}) -> some View {
        return Button("Remove \(value)", role: .destructive, action: action)
    }

}

