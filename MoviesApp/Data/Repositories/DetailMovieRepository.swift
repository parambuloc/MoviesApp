//
//  DetailMovieRepository.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class DetailMovieRepository: DetailMovieRepositoryType {
    
    private let apiDataSource: DetailMovieDataSourceType
    private let domainErrorMapper: DomainErrorMapper
    private let detailMovieDomainMapper: DetailMovieDomainMapper
    
    init(apiDataSource: DetailMovieDataSourceType,
         domainErrorMapper: DomainErrorMapper,
         detailMovieDomainMapper: DetailMovieDomainMapper) {
        self.apiDataSource = apiDataSource
        self.domainErrorMapper = domainErrorMapper
        self.detailMovieDomainMapper = detailMovieDomainMapper
    }
    
    func getDetailMovie(id: String) async -> Result<DetailMovie, DomainError> {
        let detailMovieResult = await apiDataSource.getDetailMovie(id: id)
        
        guard case .success(let detail) = detailMovieResult else {
            return .failure(domainErrorMapper.map(error: detailMovieResult.failureValue as? HTTPClientError))
        }

        return .success(detailMovieDomainMapper.map(detail: detail))
    }
}
