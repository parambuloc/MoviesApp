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
        fromViewController.present(DetailMovieFactory.create(id: movieId), animated: true)
    }
}
