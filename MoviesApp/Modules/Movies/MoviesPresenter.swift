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
    func onAppear()
    func onPaginate()
    func onSearch(searchText: String)
    func onTapCell(atIndex: Int)
}

class MoviesPresenter: MoviesPresentable {
    private let moviesInteractor: MoviesInteractable
    private let mapper: MovieCellViewMapper
    private var page: Int = 1
    private var isLastPage: Bool = false
    private var isFiltering: Bool = false
    private var movies: [Movie] = []
    private var filteredMovies: [Movie] = []
    private let router: MoviesRouting
    
    weak var ui: MoviesUI?
    var movieCellViewModels = [MovieCellViewModel]()
    
    init(router: MoviesRouting,
         moviesInteractor: MoviesInteractable,
         mapper: MovieCellViewMapper = MovieCellViewMapper()) {
        self.router = router
        self.moviesInteractor = moviesInteractor
        self.mapper = mapper
    }
    
    func onAppear() {
        Task {
            page = 1
            let result = await moviesInteractor.getMovies(page: page)
            guard case .success(let movies) = result else {
                ui?.errorLoadList(error: "Error al cargar la lista")
                return
            }
            self.movies = movies.results
            self.filteredMovies = self.movies
            isLastPage = movies.totalPages == page
            movieCellViewModels = movies.results.map(mapper.map(entity:))
            ui?.updateList()
        }
    }
    
    func onSearch(searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
            self.filteredMovies = self.movies
        } else {
            isFiltering = true
            self.filteredMovies = self.movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        movieCellViewModels = filteredMovies.map(mapper.map(entity:))
        ui?.updateList()
    }
    
    func onPaginate() {
        Task {
            let models = await moviesInteractor.getMovies(page: page)
            guard case .success(let movies) = models else {
                ui?.errorLoadList(error: "Error al paginar")
                return
            }
            self.movies += movies.results
            self.filteredMovies = self.movies
            isLastPage = movies.totalPages == page
            movieCellViewModels = self.movies.map(mapper.map(entity:))
            page = isLastPage ? 1 : page + 1
            ui?.updateList()
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = filteredMovies[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
    
}
