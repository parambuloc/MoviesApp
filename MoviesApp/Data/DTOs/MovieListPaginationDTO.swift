//
//  MovieListPaginationDTO.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

struct MovieListPaginationDTO: Codable {
    let page: Int
    let totalPages: Int
    let results: [MovieDTO]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
}
