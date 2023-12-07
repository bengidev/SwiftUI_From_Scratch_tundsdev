//
//  FileStorageManager.swift
//  FileManager And NSCache
//
//  Created by Bambang Tri Rahmat Doni on 07/12/23.
//

import Foundation

final class FileStorageManager {
    static let shared: FileStorageManager = .init()
    
    private init () {}
    
    private let manager: FileManager = .default
    
    private var cacheFolderURL: URL? {
        return self.manager.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        ).first
    }
    
    func save(_ item: Item) -> Void {
        guard let cacheFolder = self.cacheFolderURL else { return }
        
        let fileURL = cacheFolder.appendingPathComponent(item.name + ".cache")
        dump(fileURL, name: "FileStorageManager File URL")
        
        do {
            let data = try JSONEncoder().encode(item)
            try data.write(to: fileURL)
        } catch {
            dump(error.localizedDescription, name: "FileStorageManager Error")
        }
    }
    
    func retrieve(from fileName: String) -> Item? {
        guard let cacheFolder = self.cacheFolderURL else { return nil }
        
        let fileURL = cacheFolder.appendingPathComponent(fileName + ".cache")
        
        guard let data = try? Data(contentsOf: fileURL),
              let item = try? JSONDecoder().decode(Item.self, from: data)
        else { return nil }
        
        dump(data, name: "FileStorageManager Data")
        dump(item, name: "FileStorageManager Item")
        
        return item
    }
    
    func remove(from fileName: String) -> Void {
        if let cacheFile = self.cacheFolderURL?.appendingPathComponent(fileName + ".cache"),
           manager.fileExists(atPath: cacheFile.path){
            do {
                try manager.removeItem(atPath: cacheFile.path)
            } catch {
                dump(error.localizedDescription, name: "FileStorageManager Error")
            }
        }
    }
}

extension FileStorageManager {
    struct Item: Codable {
        let name: String
        let data: Data
        let evictionDate: Date
        
        init(name: String, data: Data, evictionDate: Date) {
            self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
            self.data = data
            self.evictionDate = evictionDate
        }
    }
}
