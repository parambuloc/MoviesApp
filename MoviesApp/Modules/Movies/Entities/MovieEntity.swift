//
//  MovieEntity.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

struct MovieEntity: Decodable {
    let id: Int
    let imageURL: String
    let title: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
