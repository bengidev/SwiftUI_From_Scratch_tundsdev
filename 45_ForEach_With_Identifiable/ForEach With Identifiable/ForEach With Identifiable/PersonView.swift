//
//  PersonView.swift
//  ForEach With Identifiable
//
//  Created by Bambang Tri Rahmat Doni on 25/11/23.
//

import SwiftUI

struct PersonView: View {
    let person: Person
    
    var body: some View {
        HStack {
            Text(person.firstName).font(.headline)
            Text(person.lastName)
        }
    }
}

#Preview {
    PersonView(person: Person.empty)
}
