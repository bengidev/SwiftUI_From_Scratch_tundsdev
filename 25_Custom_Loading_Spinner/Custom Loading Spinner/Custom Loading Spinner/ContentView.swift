//
//  ContentView.swift
//  Custom Loading Spinner
//
//  Created by Bambang Tri Rahmat Doni on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var progressValue: Double = 0.0
    @State private var progressValue2: Double = 0.0
    @State private var progressValue3: Double = 0.0
    
    var body: some View {
        VStack {
            VStack {
                ProgressView()
                Text("Loading...").font(.headline)
            }
            .padding(.bottom, 20)
            
            
            
            VStack {
                ProgressView("Progress Bar", value: self.progressValue)
                Button("Increase") {
                    withAnimation {
                        self.progressValue += 0.1
                    }
                }
            }
            .padding(.bottom, 20)
            
            
            
            VStack {
                ProgressView("Progress Bar 2",
                             value: self.progressValue2)
                Button("Increase") {
                    withAnimation {
                        self.progressValue2 += 0.1
                    }
                }
            }
            .padding(.bottom, 20)
            
            
            
            VStack {
                ProgressView(value: self.progressValue3,
                             total: 100.0) {
                    Label("Upload Progress \(self.progressValue3.formatted())%",
                          systemImage: "arrow.triangle.2.circlepath.icloud.fill")
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                Button("Increase") {
                    withAnimation {
                        if self.progressValue3.isLess(than: 100.0) {
                            self.progressValue3 += 5
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            
            
            
            VStack {
                ProgressView(value: self.progressValue3,
                             total: 100.0) {
                    Label("Upload Progress \(self.progressValue3.formatted())%",
                          systemImage: "arrow.triangle.2.circlepath.icloud.fill")
                    .frame(maxWidth: .infinity, alignment: .center)
                }.progressViewStyle(.rounded())
                Button("Increase") {
                    withAnimation {
                        if self.progressValue3.isLess(than: 100.0) {
                            self.progressValue3 += 5
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            
            
            
            VStack {
                ProgressView {
                    Label("Fetching some content",
                          systemImage: "arrow.triangle.2.circlepath.icloud.fill")
                }
                .tint(.black)
                .foregroundStyle(.black)
            }
            .padding(.bottom, 20)
            
            
            
            VStack {
                ProgressView {
                    Label("Fetching some content",
                          systemImage: "arrow.triangle.2.circlepath.icloud.fill")
                }
                .progressViewStyle(.rounded())
            }
            .padding(.bottom, 20)
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
