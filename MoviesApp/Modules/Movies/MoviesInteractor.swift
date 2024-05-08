//
//  MoviesInteractor.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

protocol MoviesInteractable: AnyObject {
    func getMovies(page: Int) async -> Result<MovieListPagination, DomainError>
}

class MoviesInteractor: MoviesInteractable {
    
    private let movieListPaginationUseCase: GetMovieListPaginationUseCaseType
    
    init(movieListPaginationUseCase: GetMovieListPaginationUseCaseType) {
        self.movieListPaginationUseCase = movieListPaginationUseCase
    }
    
    func getMovies(page: Int) async -> Result<MovieListPagination, DomainError> {
        return await movieListPaginationUseCase.paginate(page: page)
    }
}
