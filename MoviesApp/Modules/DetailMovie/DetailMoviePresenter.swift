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
    weak var ui: DetailMovieUI?
    
    let movieId: String
    private let detailMovieInteractor: DetailMovieInteractable
    private let mapper: DetailMovieViewMapper
    
    init(movieId: String, detailMovieInteractor: DetailMovieInteractor, mapper: DetailMovieViewMapper = DetailMovieViewMapper()) {
        self.movieId = movieId
        self.detailMovieInteractor = detailMovieInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let result = await detailMovieInteractor.getDetailMovie(id: movieId)
            guard case .success(let detail) = result else {
                return
            }
            let viewModel = mapper.map(entity: detail)
            await MainActor.run {
                ui?.update(movie: viewModel)
            }
        }
    }
}
