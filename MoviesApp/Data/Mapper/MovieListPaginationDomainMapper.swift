//
//  MovieListPaginationDomainMapper.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class MovieListPaginationDomainMapper {
    func map(pagination: MovieListPaginationDTO) -> MovieListPagination {
        let movieList = pagination.results.map {
            return Movie(id: $0.id,
                         imageURL: $0.imageURL,
                         title: $0.title,
                         voteAverage: $0.voteAverage,
                         releaseDate: $0.releaseDate,
                         overview: $0.overview)
        }
        
        return MovieListPagination(page: pagination.page,
                                   totalPages: pagination.totalPages,
                                   results: movieList)
    }
}
