//
//  DetailMovieViewMapper.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

struct DetailMovieViewMapper {
    func map(entity: DetailMovie) -> DetailMovieViewModel {
        return DetailMovieViewModel(posterPath: URL(string: "https://image.tmdb.org/t/p/w500/" + entity.posterPath),
                                    title: entity.title,
                                    voteAverage: entity.voteAverage,
                                    releaseDate: entity.releaseDate,
                                    overview: entity.overview)
    }
}
