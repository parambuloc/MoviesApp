//
//  DetailMovieInteractor.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

protocol DetailMovieInteractable: AnyObject {
   func getDetailMovie(id: String) async -> Result<DetailMovie, DomainError>
}

class DetailMovieInteractor: DetailMovieInteractable {

    private let detailMovieUseCase: GetDetailMovieUseCaseType
    
    init(detailMovieUseCase: GetDetailMovieUseCaseType) {
        self.detailMovieUseCase = detailMovieUseCase
    }
    
    func getDetailMovie(id: String) async -> Result<DetailMovie, DomainError> {
        return await detailMovieUseCase.execute(id: id)
    }
}
