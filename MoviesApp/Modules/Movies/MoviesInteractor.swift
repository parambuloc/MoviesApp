//
//  MoviesInteractor.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

class MoviesInteractor {
    func getMovies(page: Int) async -> MovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=es-PE&page=\(page)&api_key=dd0f4584625c2b35ecc3047eb390d34f")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(MovieResponseEntity.self, from: data)
    }
}
