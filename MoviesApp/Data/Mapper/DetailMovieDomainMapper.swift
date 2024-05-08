//
//  DetailMovieDomainMapper.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class DetailMovieDomainMapper {
    func map(detail: DetailMovieDTO) -> DetailMovie {
        return DetailMovie(posterPath: detail.posterPath,
                           title: detail.title,
                           voteAverage: detail.voteAverage,
                           releaseDate: detail.releaseDate,
                           overview: detail.overview)
    }
}
