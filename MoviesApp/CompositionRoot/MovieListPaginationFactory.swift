//
//  MovieListPaginationFactory.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class MovieListPaginationFactory {
    static func create(router: MoviesRouting) -> MoviesView {
        let interactor = MoviesInteractor(movieListPaginationUseCase: createUseCase())
        let presenter = MoviesPresenter(router: router,
                                        moviesInteractor: interactor)
        let moviesView = MoviesView(presenter: presenter)
        presenter.ui = moviesView
        
        return moviesView
    }
    
    private static func createUseCase() -> GetMovieListPaginationUseCaseType {
        return GetMovieListPaginationUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> MovieListPaginationRepositoryType {
        return MovieListPaginationRepository(apiDataSource: createDataSource(),
                                domainErrorMapper: DomainErrorMapper(),
                                movieListPaginationDomainMapper: MovieListPaginationDomainMapper())
    }
    
    private static func createDataSource() -> MovieListPaginationDataSourceType {
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(),
                                              errorResolver: URLSessionErrorResolver())
        return MovieListPaginationDataSource(httpClient: httpClient)
    }
}
