//
//  MoviesPresenter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

protocol MoviesUI: AnyObject {
    func updateList()
}

class MoviesPresenter {
    private let moviesInteractor: MoviesInteractor
    private let mapper: MovieCellViewMapper
    weak var ui: MoviesUI?
    private var page: Int = 1
    private var isLastPage: Bool = false
    public var movieCellViewModels = [MovieCellViewModel]()
    
    init(moviesInteractor: MoviesInteractor,
         mapper: MovieCellViewMapper = MovieCellViewMapper()) {
        self.moviesInteractor = moviesInteractor
        self.mapper = mapper
    }
    
    func onSearch() {
        Task {
            page = 1
            let movies = await moviesInteractor.getMovies(page: page)
            isLastPage = movies.totalPages == page
            movieCellViewModels = movies.results.map(mapper.map(entity:))
            ui?.updateList()
        }
    }
    
    func onPaginate() {
        Task {
            let movies = await moviesInteractor.getMovies(page: page)
            isLastPage = movies.totalPages == page
            movieCellViewModels += movies.results.map(mapper.map(entity:))
            page = isLastPage ? 1 : page + 1
            ui?.updateList()
        }
    }
    
}
