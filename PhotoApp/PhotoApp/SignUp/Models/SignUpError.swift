//
//  SignUpError.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 17/05/23.
//

import Foundation

enum SignUpError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
}
