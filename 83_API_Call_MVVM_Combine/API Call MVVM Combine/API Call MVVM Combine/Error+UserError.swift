//
//  Error+UserError.swift
//  API Call MVVM Combine
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import Foundation

enum UserError: LocalizedError {
    case external(error: Error)
    case failedToDecode
    case invalidStatusCode
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .external(let error):
            return error.localizedDescription
        case .failedToDecode:
            return "Failed to Decode the Response Data"
        case .invalidStatusCode:
            return "Failed to receive Response Data with error code"
        case .unknown:
            return "Failed to receive Response Data"
        }
    }
}

