//
//  ContentView.swift
//  Observable And Published Object
//
//  Created by Bambang Tri Rahmat Doni on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = PeopleViewModel()
    
    var body: some View {
        VStack {
            if self.vm.isLoading {
                ProgressView {
                    Text("Loading")
                        .font(.system(size: 16, weight: .bold))
                }
            } else {
                Image(systemName: "person.3.sequence.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(self.vm.people.isEmpty ?
                     "Empty Users" :
                        "Managed to get \(self.vm.people.count) users.")
            }
            
            Button(action: self.vm.fetchPeople, label: {
                Text(self.vm.isLoading ? "Fetching People" : "Fetch People")
            })
            .padding(.top, 30)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
