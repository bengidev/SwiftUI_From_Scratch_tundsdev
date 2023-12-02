//
//  ContentView.swift
//  Menu And MenuStyle In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            self.helloView()
            
            self.exampleOneMenuView()
            self.exampleTwoMenuView()
            self.exampleThreeMenuView()
            self.exampleFourMenuView() {
                print("Perform example four menu view")
            }
            self.exampleFiveMenuView() {
                print("Perform example five menu view")
            }
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
            Text("Hello, world!")
            Divider()
        }
        .font(.headline)
        .padding()
        .background(Material.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 15.0))
        .padding()
    }
    
    @ViewBuilder
    private func exampleOneMenuView() -> some View {
        Menu("Actions Example One") {
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
        }
    }
    
    @ViewBuilder
    private func exampleTwoMenuView() -> some View {
        Menu {
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
                title: { Text("Actions Example Two") },
                icon: { Image(systemName: "doc.badge.ellipsis") }
            )
            .font(.headline)
        }
    }
    
    @ViewBuilder
    private func exampleThreeMenuView() -> some View {
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
                title: { Text("Actions Example Three") },
                icon: { Image(systemName: "filemenu.and.cursorarrow") }
            )
            .font(.headline)
        }
    }
    
    @ViewBuilder
    private func exampleFourMenuView(primaryAction: (@escaping () -> Void) = {}) -> some View {
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
        } label: {
            Label(
                title: { Text("Actions Example Four") },
                icon: { Image(systemName: "filemenu.and.selection") }
            )
            .font(.headline)
        } primaryAction: {
            primaryAction()
        }
    }
    
    @ViewBuilder
    private func exampleFiveMenuView(primaryAction: (@escaping () -> Void) = {}) -> some View {
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
        } label: {
            Label(
                title: { Text("Actions Example Five") },
                icon: { Image(systemName: "contextualmenu.and.cursorarrow") }
            )
            .font(.headline)
        } primaryAction: {
            primaryAction()
        }
        .menuStyle(.ultraThin)
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

