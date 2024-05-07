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
    func onTapCell(atIndex: Int)
}

class MoviesPresenter: MoviesPresentable {
    private let moviesInteractor: MoviesInteractable
    private let mapper: MapperMovieCellView
    private var page: Int = 1
    private var isLastPage: Bool = false
    private let router: MoviesRouting
    private var movies: [MovieEntity] = []
    
    weak var ui: MoviesUI?
    var movieCellViewModels = [MovieCellViewModel]()
    
    init(moviesInteractor: MoviesInteractable,
         mapper: MapperMovieCellView = MapperMovieCellView(),
         router: MoviesRouting) {
        self.moviesInteractor = moviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onSearch() {
        Task {
            page = 1
            let models = await moviesInteractor.getMovies(page: page)
            self.movies = models.results
            isLastPage = models.totalPages == page
            movieCellViewModels = models.results.map(mapper.map(entity:))
            ui?.updateList()
        }
    }
    
    func onPaginate() {
        Task {
            let models = await moviesInteractor.getMovies(page: page)
            self.movies = models.results
            isLastPage = models.totalPages == page
            movieCellViewModels += models.results.map(mapper.map(entity:))
            page = isLastPage ? 1 : page + 1
            ui?.updateList()
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = movies[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
    
}
