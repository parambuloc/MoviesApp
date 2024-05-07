//
//  MoviesRouter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation
import UIKit

protocol MoviesRouting: AnyObject {
    var detailMovieRouter: DetailMovieRouting? { get }
    var moviesView: MoviesView? { get }
    
    func showMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
}

class MoviesRouter: MoviesRouting {
    var detailMovieRouter: DetailMovieRouting?
    var moviesView: MoviesView?
    
    func showMovies(window: UIWindow?) {
        self.detailMovieRouter = DetailMovieRouter()
        
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(moviesInteractor: interactor, router: self)
        
        moviesView = MoviesView(presenter: presenter)
        presenter.ui = moviesView
        
        DispatchQueue.main.async {
            window?.rootViewController = self.moviesView
            window?.makeKeyAndVisible()
        }
    }
    
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = moviesView else { return }
        detailMovieRouter?.showDetail(fromViewController: fromViewController,
                                      withMovieId: movieId)
    }
}
