//
//  DomainErrorMapper.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

enum DomainError: Error {
    case generic
}

class DomainErrorMapper {
    func map(error: HTTPClientError?) -> DomainError {
        return .generic
    }
}
