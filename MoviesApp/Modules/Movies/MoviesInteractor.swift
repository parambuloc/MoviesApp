//
//  MoviesInteractor.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

protocol MoviesInteractable: AnyObject {
    func getMovies(page: Int) async -> MovieResponseEntity
}

class MoviesInteractor: MoviesInteractable {
    func getMovies(page: Int) async -> MovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=es-PE&page=\(page)&api_key=dd0f4584625c2b35ecc3047eb390d34f")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(MovieResponseEntity.self, from: data)
    }
}

class MoviesInteractorMock: MoviesInteractable {
    func getMovies(page: Int) async -> MovieResponseEntity {
        return MovieResponseEntity(page: 1, totalPages: 1, results: [
            MovieEntity(id: 0,
                        imageURL: "",
                        title: "Title 1",
                        voteAverage: 1,
                        releaseDate: "",
                        overview: "Description 1"),
            MovieEntity(id: 1,
                        imageURL: "",
                        title: "Title 2",
                        voteAverage: 2,
                        releaseDate: "",
                        overview: "Description 2")
        ])
    }
}
