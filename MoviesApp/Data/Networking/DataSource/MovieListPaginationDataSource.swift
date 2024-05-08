//
//  MovieListPaginationDataSource.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class MovieListPaginationDataSource: MovieListPaginationDataSourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getMovieListPagination(page: Int) async -> Result<MovieListPaginationDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [
            "language": "es_PE",
            "page": page,
            "api_key": "dd0f4584625c2b35ecc3047eb390d34f"
        ]
        let endpoint = Endpoint(path: "movie/upcoming",
                                queryParameters: queryParameters,
                                method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://api.themoviedb.org/3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let movieListPagination = try? JSONDecoder().decode(MovieListPaginationDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        
        return .success(movieListPagination)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
