//
//  DetailMovieRouter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation
import UIKit

protocol DetailMovieRouting: AnyObject {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String)
}

class DetailMovieRouter: DetailMovieRouting {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String) {
        let interactor = DetailMovieInteractor()
        let presenter = DetailMoviePresenter(movieId: movieId,
                                             detailMovieInteractor: interactor)
        let view = DetailMovieView(presenter: presenter)
        presenter.ui = view
        
        fromViewController.present(view, animated: true)
    }
}
