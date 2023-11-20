//
//  ContentView.swift
//  Button In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCount: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    Text("The number of total count: \(self.totalCount)").bold()
                    Spacer(minLength: 10)
                    Button {
                        withAnimation {
                            self.totalCount += 1
                        }
                    } label: {
                        Text("Increment Count")
                    }
                }
                
                VStack {
                    Text("The number of total count: \(self.totalCount)").bold()
                    Spacer(minLength: 10)
                    Button(action: self.incrementTotalByOne) {
                        Text("Increment One Count")
                    }
                }
                
                VStack {
                    Group {
                        Button(role: .cancel) {
                            print("Cancel Button was pressed!")
                        } label: {
                            Text("Cancel Button")
                        }
                        
                        Button(role: .destructive) {
                            print("Destructive Button was pressed!")
                        } label: {
                            Text("Destructive Button")
                        }
                        
                        Button(role: .none) {
                            print("Normal Button was pressed!")
                        } label: {
                            Text("Normal Button")
                        }

                    }
                }
                
                VStack {
                    Button {
                        print("Press Button was pressed!")
                    } label: {
                        Text("Press Button")
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .foregroundStyle(.white)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    }
                }
                
                VStack {
                    Button {
                        print("Send Button was pressed!")
                    } label: {
                        Text("Send Button")
                    }
                    .buttonStyle(.send())
                }
                
                VStack {
                    SendButton {
                        self.sendMail(to: "Author", with: "Great Job!")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    private func incrementTotalByOne() -> Void {
        self.totalCount += 1
    }
    
    private func sendMail(to person: String, with value: String) -> Void {
        print("Sending mail to: \(person) with message: \(value)")
    }
}
