//
//  ContentView.swift
//  Download Images with AsyncImage
//
//  Created by Bambang Tri Rahmat Doni on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var url: URL?
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: true) {
                VStack {
                    self.homeAsyncImageView(with: self.url)
                    self.imageAuthorView(of: "Nadir Balcikli")
                    self.imageTitleView(of: "Silver MacBook and black JBL")
                    self.imageSubTitleView(of: "Macbook on a white table")
                    self.imagePublishedView(of: "September 28, 2013")
                }
                .padding(12.0)
                .padding(.bottom, 20.0)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.large)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.url = URL(string: "https://picsum.photos/id/119/3264/2176")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func homeAsyncImageView(with url: URL?) -> some View {
        return AsyncImage(url: url,
                          transaction: Transaction.init(animation: .easeInOut)) {
            phase in
            switch phase {
            case .empty:
                ProgressView("Loading...")
            case .success(let image):
                image.resizable()
            case .failure(let error):
                self.errorAsyncImageView(error)
            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300.0)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10.0)
        .transition(.opacity.combined(with: .scale))
    }
    
    private func errorAsyncImageView(_ error: Error?) -> some View {
        return VStack {
            Label {
                Text("Image Error")
                    .font(.title.bold())
            } icon: {
                Image(systemName: "exclamationmark.triangle")
                    .font(.title)
            }
            
            Divider()
                .padding(.bottom, 10.0)
            
            Text("An error was occurred when trying to load your image " +
                 "with message: \(String(describing: error?.localizedDescription))")
            .font(.body)
        }
        .padding()
    }

    private func imageAuthorView(of value: String = "") -> some View {
        return HStack {
            Label(
                title: { Text("Author").font(.headline) },
                icon: { Image(systemName: "person.text.rectangle").font(.headline) }
            )
            .frame(width: 120.0, alignment: .leading)
            Text(value).font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 20.0)
    }
    
    private func imageTitleView(of value: String = "") -> some View {
        return HStack {
            Label(
                title: { Text("Title").font(.headline) },
                icon: { Image(systemName: "captions.bubble").font(.headline) }
            )
            .frame(width: 120.0, alignment: .leading)
            Text(value).font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 10.0)
    }
    
    private func imageSubTitleView(of value: String = "") -> some View {
        return HStack {
            Label(
                title: { Text("Subtitle").font(.headline) },
                icon: { Image(systemName: "text.bubble").font(.headline) }
            )
            .frame(width: 120.0, alignment: .leading)
            Text(value).font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 10.0)
    }
    
    private func imagePublishedView(of value: String = "") -> some View {
        return HStack {
            Label(
                title: { Text("Published").font(.headline) },
                icon: { Image(systemName: "checkmark.bubble").font(.headline) }
            )
            .frame(width: 120.0, alignment: .leading)
            Text(value).font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 10.0)
    }
}
