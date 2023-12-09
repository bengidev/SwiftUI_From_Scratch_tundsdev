//
//  Error+UserError.swift
//  API Call MVVM
//
//  Created by Bambang Tri Rahmat Doni on 09/12/23.
//

import Foundation

enum UserError: LocalizedError {
    case external(error: Error)
    case failedToDecode
    
    var errorDescription: String? {
        switch self {
        case .external(let error):
            return error.localizedDescription
        case .failedToDecode:
            return "Failed to Decode the Response Data"
        }
    }
}
