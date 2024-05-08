//
//  DetailMovieDataSourceType.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol DetailMovieDataSourceType {
    func getDetailMovie(id: String) async -> Result<DetailMovieDTO, HTTPClientError>
}
