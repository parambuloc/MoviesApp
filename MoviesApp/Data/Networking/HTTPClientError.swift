//
//  HTTPClientError.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

enum HTTPClientError: Error {
    case badURL
    case clientError
    case serverError
    case generic
    case parsingError
    case responseError
}
