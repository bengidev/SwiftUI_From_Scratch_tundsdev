//
//  ImageCacheManager.swift
//  FileManager And NSCache
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import Foundation

@MainActor
final class ImageCacheManager: ObservableObject {
    @Published private(set) var state: State?
    
    func loadImage(_ item: (name: String, url: String)) async -> Void {
        /**
         Scenarios:
         
         1. Check if the image is in memory > if it is then return that image > 
            If not then check on disk
         
         2. Check if the image is on disk and within the expiration date range > 
            If it is then return the image and store it in memory for later >
            If not then start the process to download the image
         
         3. Try to fetch the image > Store it on disk and in memory for later
         
         */
        
        if let cachedImage = ImageCacher.shared.getObject(forKey: item.name as NSString) {
            dump(item.name, name: "Cached Image")
            
            self.state = .success(data: cachedImage)
            return
        }
        
        if let diskCachedImage = FileStorageManager.shared.retrieve(from: item.name),
           Date.now < diskCachedImage.evictionDate {
            ImageCacher.shared.setObject(
                diskCachedImage.data as NSData,
                forKey: diskCachedImage.name as NSString
            )
            dump(diskCachedImage, name: "FileManager Cached Image")
            
            self.state = .success(data: diskCachedImage.data)
            return
        }
        
        FileStorageManager.shared.remove(from: item.name)
        
        self.state = .loading
        
        do {
            let cachedData = try await ImageRetriever.fetchImage(url: item.url)
            ImageCacher.shared.setObject(cachedData as NSData, forKey: item.name as NSString)
            
            print("Image to cache: \(item.url)")
            dump(item.url, name: "Image To Cache")
            
            if let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: .now) {
                let item = FileStorageManager.Item(
                    name: item.name,
                    data: cachedData,
                    evictionDate: tomorrow
                )
                FileStorageManager.shared.save(item)
            }
            
            self.state = .success(data: cachedData)
            
        } catch let error as ImageRetriever.RetrieverError {
            switch error {
            case .invalidUrl(let error):
                self.state = .failed(error: ImageRetriever.RetrieverError.invalidUrl(error: error))
                
                print("Error from ImageRetriever: \(error)")
                dump("Error: \(error.localizedDescription)", name: "ImageRetriever")
            }
        }
        catch {
            self.state = .failed(error: error)
            
            print("Error from ImageCacheManager: \(error)")
            dump("Error: \(error.localizedDescription)", name: "ImageCacheManager")
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


