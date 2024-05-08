//
//  URLSessionRequestMaker.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class URLSessionRequestMaker {
    func url(endpoint: Endpoint, baseURL: String) -> URL? {
        var urlComponents = URLComponents(string: baseURL + endpoint.path)
        let urlQueryParameters = endpoint.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        urlComponents?.queryItems = urlQueryParameters
        return urlComponents?.url
    }
}
