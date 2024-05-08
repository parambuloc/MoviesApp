//
//  URLSessionErrorResolver.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class URLSessionErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {

        guard statusCode < 500 else {
            return .clientError
        }
        
        return .serverError
    }
    
    func resolve(error: Error) -> HTTPClientError {
        return .generic
    }
}
