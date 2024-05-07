//
//  DetailMovieInteractor.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

protocol DetailMovieInteractable: AnyObject {
   func getDetailMovie(id: String) async -> DetailMovieEntity
}

class DetailMovieInteractor: DetailMovieInteractable {
    func getDetailMovie(id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?language=es-PE&api_key=dd0f4584625c2b35ecc3047eb390d34f")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(DetailMovieEntity.self, from: data)
    }
}
