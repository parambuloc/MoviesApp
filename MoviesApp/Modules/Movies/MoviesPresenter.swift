//
//  MoviesPresenter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation

protocol MoviesPresentable: AnyObject {
    var ui: MoviesUI? { get }
    var movieCellViewModels: [MovieCellViewModel] { get }
    func onSearch()
    func onPaginate()
}

class MoviesPresenter: MoviesPresentable {
    private let moviesInteractor: MoviesInteractable
    private let mapper: MovieCellViewMapper
    private var page: Int = 1
    private var isLastPage: Bool = false
    
    weak var ui: MoviesUI?
    var movieCellViewModels = [MovieCellViewModel]()
    
    init(moviesInteractor: MoviesInteractable,
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
