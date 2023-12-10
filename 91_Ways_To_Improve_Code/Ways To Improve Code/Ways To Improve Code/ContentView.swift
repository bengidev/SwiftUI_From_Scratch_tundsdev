//
//  ContentView.swift
//  Ways To Improve Code
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        self.helloView()
        
        Form {
            self.infoSection()
            self.contactSection()
            self.addressSection()
            
            self.submitButton {
                print("Submit Button tapped!")
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
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .font(.headline)
            .padding()
            .background(Material.ultraThin)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
        }
    }
    
    @ViewBuilder
    private func infoSection() -> some View {
        Section("Info") {
            TextField("Title", text: .constant(""))
            TextField("First Name", text: .constant(""))
            TextField("Last Name", text: .constant(""))
            DatePicker("Age", selection: .constant(.now))
        }
    }
    
    @ViewBuilder
    private func contactSection() -> some View {
        Section("Contact") {
            TextField("Email", text: .constant(""))
            TextField("Phone", text: .constant(""))
        }
    }

    @ViewBuilder
    private func addressSection() -> some View {
        Section("Address") {
            TextField("1st Line Address", text: .constant(""))
            TextField("2nd Line Address", text: .constant(""))
            TextField("City", text: .constant(""))
            TextField("County", text: .constant(""))
            TextField("Postcode", text: .constant(""))
        }
    }
    
    @ViewBuilder
    private func submitButton(action: (@escaping () -> Void) = {}) -> some View {
        Button("Submit", action: action)
    }
}
