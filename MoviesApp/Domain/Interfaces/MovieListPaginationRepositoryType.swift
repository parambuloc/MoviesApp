//
//  MovieListPaginationRepositoryType.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol MovieListPaginationRepositoryType {
    func getMovieListPagination(page: Int) async -> Result<MovieListPagination, DomainError>
}
