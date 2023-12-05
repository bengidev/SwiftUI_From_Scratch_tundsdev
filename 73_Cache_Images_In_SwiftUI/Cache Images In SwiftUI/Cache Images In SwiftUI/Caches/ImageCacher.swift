//
//  ImageCacher.swift
//  Cache Images In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import Foundation

final class ImageCacher: NSObject {
    typealias CacheType = NSCache<NSString, NSData>
    
    static let shared: ImageCacher = .init()
    
    private override init() {
        super.init()
    }
    
    func getObject(forKey key: NSString) -> Data? {
        return self.cache.object(forKey: key) as? Data
    }
    
    func setObject(_ object: NSData, forKey key: NSString) -> Void {
        self.cache.setObject(object, forKey: key)
    }
    
    private lazy var cache: CacheType = {
        let cache = CacheType()
        cache.countLimit = 100
        cache.totalCostLimit = 50 * 1024 * 1024 // ~50MB
        
        return cache
    }()
}
