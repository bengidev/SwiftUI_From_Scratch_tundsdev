//
//  ContentView.swift
//  ForEach With Identifiable
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var people: [Person] = []
    
    var body: some View {
        VStack {
            ForEach(self.people) { person in
                PersonView(person: person)
            }
        }
        .padding()
        .onAppear { self.people = Person.example}
    }
}

#Preview {
    ContentView()
}

