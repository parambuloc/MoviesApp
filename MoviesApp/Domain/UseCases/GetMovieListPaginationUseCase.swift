//
//  GetMovieListPaginationUseCase.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol GetMovieListPaginationUseCaseType {
    func paginate(page: Int) async -> Result<MovieListPagination, DomainError>
}

class GetMovieListPaginationUseCase: GetMovieListPaginationUseCaseType {
    private let repository: MovieListPaginationRepositoryType
    
    init(repository: MovieListPaginationRepositoryType) {
        self.repository = repository
    }
    
    func paginate(page: Int) async -> Result<MovieListPagination, DomainError> {
        let result = await repository.getMovieListPagination(page: page)
        
        guard let result = try? result.get() else {
            return .failure(.generic)
        }
        
        return .success(result)
    }
}
