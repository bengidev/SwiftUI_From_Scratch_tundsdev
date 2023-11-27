//
//  NetworkError.swift
//  Show Alerts In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import Foundation

enum NetworkError {
    case none
    case badRequest
    case failedToDecode
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case.none:
            return "Unknown error"
        case .badRequest:
            return "The network request failed"
        case .failedToDecode:
            return "Failed to decode data"
        }
    }
    
    var message: String {
        
        switch self {
        case .badRequest:
            return "Seems like something went horribly wrong"
        case .failedToDecode:
            return "Seems like we failed to decode the response"
        case .none:
            return "Unknown"
        }
    }
    
    var suggestion: String {
        "Try sending the request again"
    }
}
