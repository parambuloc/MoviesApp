//
//  MovieListPaginationRepository.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class MovieListPaginationRepository: MovieListPaginationRepositoryType {
    
    private let apiDataSource: MovieListPaginationDataSourceType
    private let domainErrorMapper: DomainErrorMapper
    private let movieListPaginationDomainMapper: MovieListPaginationDomainMapper
    
    init(apiDataSource: MovieListPaginationDataSourceType,
         domainErrorMapper: DomainErrorMapper,
         movieListPaginationDomainMapper: MovieListPaginationDomainMapper) {
        self.apiDataSource = apiDataSource
        self.domainErrorMapper = domainErrorMapper
        self.movieListPaginationDomainMapper = movieListPaginationDomainMapper
    }
    
    func getMovieListPagination(page: Int) async -> Result<MovieListPagination, DomainError> {
        let movieListPaginationResult = await apiDataSource.getMovieListPagination(page: page)
        
        guard case .success(let pagination) = movieListPaginationResult else {
            return .failure(domainErrorMapper.map(error: movieListPaginationResult.failureValue as? HTTPClientError))
        }

        return .success(movieListPaginationDomainMapper.map(pagination: pagination))
    }
}
