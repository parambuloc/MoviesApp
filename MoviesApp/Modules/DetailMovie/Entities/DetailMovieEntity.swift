//
//  DetailMovieEntity.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let posterPath: String
    let title: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
