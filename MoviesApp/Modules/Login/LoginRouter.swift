//
//  LoginRouter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation
import UIKit

protocol LoginRouting: AnyObject {
    var moviesRouter: MoviesRouting? { get }
    var loginView: LoginView? { get }
    var window: UIWindow? { get }
    
    func showMovieList()
    func showLogin(window: UIWindow?)
}

class LoginRouter: LoginRouting {
    var moviesRouter: MoviesRouting?
    var loginView: LoginView?
    var window: UIWindow?
    
    func showLogin(window: UIWindow?) {
        self.window = window
        self.moviesRouter = MoviesRouter()
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(router: self, loginInteractor: interactor)
        
        loginView = LoginView(presenter: presenter)
        presenter.ui = loginView
        
        window?.rootViewController = loginView
        window?.makeKeyAndVisible()
    }
    
    func showMovieList() {
        guard let window = window else { return }
        moviesRouter?.showMovies(window: window)
    }
}
