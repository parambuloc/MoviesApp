//
//  DetailMovieRepositoryType.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol DetailMovieRepositoryType {
    func getDetailMovie(id: String) async -> Result<DetailMovie, DomainError>
}
