//
//  ContentView.swift
//  Menu VS ContextMenu In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            self.helloView()
            self.imageView()
            self.exampleOneMenuView()
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Menu VS Context Menu!")
            Divider()
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 15.0))
        .padding()
    }
    
    @ViewBuilder
    private func imageView() -> some View {
        Image("mountain")
            .resizable()
            .frame(height: 200.0)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .padding()
            .shadow(radius: 5.0)
            .contextMenu {
                self.customButton(title: "Share Item",
                                  imageName: "square.and.arrow.up") {
                    print("Perform share item")
                }
                self.customButton(title: "Print Item",
                                  imageName: "printer") {
                    print("Perform print item")
                }
            }
        
    }
    
    @ViewBuilder
    private func exampleOneMenuView() -> some View {
        Menu {
            Menu {
                self.customButton(title: "Share Item",
                                  imageName: "square.and.arrow.up") {
                    print("Perform share item")
                }
                self.customButton(title: "Print Item",
                                  imageName: "printer") {
                    print("Perform print item")
                }
            } label: {
                Label(
                    title: { Text("More") },
                    icon: { Image(systemName: "ellipsis.rectangle") }
                )
            }
            
            self.customButton(title: "Delete",
                              imageName: "trash",
                              role: .destructive) {
                print("Perform delete")
            }
            self.customButton(title: "Add New Item",
                              imageName: "plus.app") {
                print("Perform add new item")
            }
            self.customButton(title: "Edit Item",
                              imageName: "square.and.pencil") {
                print("Perform edit item")
            }
            self.customButton(title: "Duplicate Item",
                              imageName: "doc.on.doc") {
                print("Perform duplicate item")
            }
        } label: {
            Label(
                title: { Text("Actions Example One") },
                icon: { Image(systemName: "filemenu.and.cursorarrow") }
            )
            .font(.headline)
        }
    }
    
    @ViewBuilder
    private func customButton(title: String = "Empty",
                              imageName: String = "",
                              role: ButtonRole? = nil,
                              action: (@escaping() -> Void) = {}) -> some View {
        Button(role: role, action: action) {
            Label(
                title: { Text(title) },
                icon: { Image(systemName: imageName) }
            )
            .font(.headline)
        }
    }
}

