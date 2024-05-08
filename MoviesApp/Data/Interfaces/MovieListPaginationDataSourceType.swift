//
//  MovieListPaginationDataSourceType.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol MovieListPaginationDataSourceType {
    func getMovieListPagination(page: Int) async -> Result<MovieListPaginationDTO, HTTPClientError>
}
