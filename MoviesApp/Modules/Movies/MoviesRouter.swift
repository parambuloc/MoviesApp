//
//  MoviesRouter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation
import UIKit

protocol MoviesRouting: AnyObject {
    var moviesView: MoviesView? { get }
    
    func start(window: UIWindow?, router: MoviesRouting)
    func showDetailMovie(withMovieId movieId: String)
}

class MoviesRouter: MoviesRouting {
    private let detailMovieRouter: DetailMovieRouting
    var moviesView: MoviesView?
    
    init(detailMovieRouter: DetailMovieRouting = DetailMovieRouter()) {
        self.detailMovieRouter = detailMovieRouter
    }
    
    func start(window: UIWindow?, router: MoviesRouting) {
        DispatchQueue.main.async {
            self.moviesView = MovieListPaginationFactory.create(router: router)
            window?.rootViewController = self.moviesView
            window?.makeKeyAndVisible()
        }
    }
    
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = moviesView else { return }
        detailMovieRouter.showDetail(fromViewController: fromViewController,
                                      withMovieId: movieId)
    }
}
