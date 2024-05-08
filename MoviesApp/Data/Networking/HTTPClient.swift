//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseURL: String) async -> Result<Data, HTTPClientError>
}
