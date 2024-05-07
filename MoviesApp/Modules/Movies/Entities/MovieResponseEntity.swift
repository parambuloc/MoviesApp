//
//  MovieResponseEntity.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

struct MovieResponseEntity: Decodable {
    let page: Int
    let totalPages: Int
    let results: [MovieEntity]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
}
