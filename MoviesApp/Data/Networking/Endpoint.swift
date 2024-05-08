//
//  Endpoint.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParameters: [String: Any]
    let method: HTTPMethod
}
