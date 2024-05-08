//
//  DetailMovieDataSource.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class DetailMovieDataSource: DetailMovieDataSourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
  
    func getDetailMovie(id: String) async -> Result<DetailMovieDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [
            "language": "es_PE",
            "api_key": "dd0f4584625c2b35ecc3047eb390d34f"
        ]
        
        let endpoint = Endpoint(path: "movie/\(id)",
                                queryParameters: queryParameters,
                                method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://api.themoviedb.org/3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let detailMoview = try? JSONDecoder().decode(DetailMovieDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        
        return .success(detailMoview)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
