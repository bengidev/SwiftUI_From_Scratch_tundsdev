//
//  ContentView.swift
//  Text And TextStyles
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                Text("Lorem Ipsum Here")
                    .bold()
                    .italic()
                    .underline(true, color: .red)
                
                Text("Lorem Ipsum Here")
                    .foregroundStyle(.mint)
                    .font(.largeTitle.weight(.black))
                
                Text("Lorem Ipsum Here")
                    .foregroundStyle(.blue)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                
                Text(.now, style: .timer)
                
                Text(.now, style: .time)
                Text(.now, style: .date)
                
                Text(Date.now,
                     format: Date.FormatStyle(date: .abbreviated, time: .shortened))
                
                Text(7200.5, format: .currency(code: "IDR"))
                Text(7200.5, format: .currency(code: "GBP"))
                Text(7200.5, format: .currency(code: "USD"))
            }
            .padding(.bottom, 10)
            
            Group {
                Text(Date.now...Date.now.addingTimeInterval(3600))
                
                Text("Calendar symbol \(Image(systemName: "calendar")) here ")
            }
            .padding(.bottom, 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
