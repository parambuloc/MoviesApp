//
//  MovieCellViewMapper.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

struct MovieCellViewMapper {
    func map(entity: Movie) -> MovieCellViewModel {
        return MovieCellViewModel(title: entity.title,
                                  overview: entity.overview,
                                  imageURL: URL(string: "https://image.tmdb.org/t/p/w500/" + entity.imageURL))
    }
}
