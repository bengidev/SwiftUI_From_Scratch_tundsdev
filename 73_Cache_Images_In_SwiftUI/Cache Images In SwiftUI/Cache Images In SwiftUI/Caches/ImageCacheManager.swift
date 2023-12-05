//
//  ImageCacheManager.swift
//  Cache Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import Foundation

@MainActor
final class ImageCacheManager: ObservableObject {
    @Published private(set) var state: State = .loading
    
    func loadImage(_ imgUrl: String) async -> Void {
        if let cachedImage = ImageCacher.shared.getObject(forKey: imgUrl as NSString) {
            
            print("Cached image: \(imgUrl)")
            dump(imgUrl, name: "Cached Image")
            
            self.state = .success(data: cachedImage)
            
            return
        }
        
        do {
            let cachedData = try await ImageRetriever.fetchImage(url: imgUrl)
            ImageCacher.shared.setObject(cachedData as NSData, forKey: imgUrl as NSString)
            
            print("Image to cache: \(imgUrl)")
            dump(imgUrl, name: "Image To Cache")
            
            self.state = .success(data: cachedData)
            
        } catch let error as ImageRetriever.RetrieverError {
            switch error {
            case .invalidUrl(let error):
                self.state = .failed(error: ImageRetriever.RetrieverError.invalidUrl(error: error))
                
                print("Error from ImageRetriever: \(error)")
                dump("Error: \(error)", name: "ImageRetriever")
            }
        }
        catch {
            self.state = .failed(error: error)
            
            print("Error from ImageCacheManager: \(error)")
            dump("Error: \(error)", name: "ImageCacheManager")
        }
    }
}

extension ImageCacheManager {
    enum State: Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case loading
        case success(data: Data)
        case failed(error: Error)
        
        static var allCases: [ImageCacheManager.State] {
            return [
                .loading,
                .success(data: Data()),
                .failed(error: URLError(URLError.Code(rawValue: 0)))
            ]
        }
        
        static func == (lhs: ImageCacheManager.State, rhs: ImageCacheManager.State) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case (.failed(let lhsError), .failed(let rhsError)):
                return lhsError.localizedDescription == rhsError.localizedDescription
            case (.success(let lhsData), .success(let rhsData)):
                return lhsData == rhsData
            default:
                return false
            }
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    }
}

