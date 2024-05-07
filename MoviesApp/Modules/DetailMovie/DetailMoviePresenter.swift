//
//  DetailMoviePresenter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

protocol DetailMoviePresentable: AnyObject {
    var ui: DetailMovieUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailMoviePresenter: DetailMoviePresentable {
    weak var ui: (any DetailMovieUI)?
    
    let movieId: String
    private let detailMovieInteractor: DetailMovieInteractor
    private let mapper: MapperDetailMovieView
    
    init(movieId: String, detailMovieInteractor: DetailMovieInteractor, mapper: MapperDetailMovieView = MapperDetailMovieView()) {
        self.movieId = movieId
        self.detailMovieInteractor = detailMovieInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await detailMovieInteractor.getDetailMovie(id: movieId)
            let viewModel = mapper.map(entity: model)
            await MainActor.run {
                ui?.update(movie: viewModel)
            }
        }
    }
}
