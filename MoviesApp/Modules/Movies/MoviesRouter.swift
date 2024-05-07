//
//  MoviesRouter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import Foundation
import UIKit

class MoviesRouter {
    func start(window: UIWindow?) {
        let interactor = MoviesInteractorMock()
        let presenter = MoviesPresenter(moviesInteractor: interactor)
        let view = MoviesView(presenter: presenter)
        presenter.ui = view
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
