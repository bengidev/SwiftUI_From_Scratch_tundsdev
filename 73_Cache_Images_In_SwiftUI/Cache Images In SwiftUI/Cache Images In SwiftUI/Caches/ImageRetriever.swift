//
//  ImageRetriever.swift
//  Cache Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import Foundation

struct ImageRetriever {
    private init() {}
    
    static func fetchImage(url imgUrl: String) async throws -> Data {
        guard let url = URL(string: imgUrl) else {
            throw RetrieverError.invalidUrl(error: URLError(.badURL))
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        dump(data, name: "Data Image Retriever")
        dump(response, name: "Response Image Retriever")
        return data
    }
}

extension ImageRetriever {
    enum RetrieverError: Error {
        case invalidUrl(error: Error)
    }
}


