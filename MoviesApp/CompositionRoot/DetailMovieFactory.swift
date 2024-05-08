//
//  DetailMovieFactory.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class DetailMovieFactory {
    static func create(id: String) -> DetailMovieView {
        let interactor = DetailMovieInteractor(detailMovieUseCase: createUseCase())
        let presenter = DetailMoviePresenter(movieId: id,
                                             detailMovieInteractor: interactor)
        let detailMovieView = DetailMovieView(presenter: presenter)
        presenter.ui = detailMovieView
        
        return detailMovieView
    }
    
    private static func createUseCase() -> GetDetailMovieUseCaseType {
        return GetDetailMovieUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> DetailMovieRepositoryType {
        return DetailMovieRepository(apiDataSource: createDataSource(),
                                     domainErrorMapper: DomainErrorMapper(),
                                     detailMovieDomainMapper: DetailMovieDomainMapper())
    }
    
    private static func createDataSource() -> DetailMovieDataSourceType {
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(),
                                              errorResolver: URLSessionErrorResolver())
        return DetailMovieDataSource(httpClient: httpClient)
    }
}
