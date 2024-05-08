//
//  GetDetailMovieUseCase.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol GetDetailMovieUseCaseType {
    func execute(id: String) async -> Result<DetailMovie, DomainError>
}

class GetDetailMovieUseCase: GetDetailMovieUseCaseType {
    private let repository: DetailMovieRepositoryType
    
    init(repository: DetailMovieRepositoryType) {
        self.repository = repository
    }
    
    func execute(id: String) async -> Result<DetailMovie, DomainError> {
        let result = await repository.getDetailMovie(id: id)
        
        guard let result = try? result.get() else {
            return .failure(.generic)
        }
        
        return .success(result)
    }
}
