//
//  LoginRouter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation
import UIKit

protocol LoginRouting: AnyObject {
    var loginView: LoginView? { get }
    var window: UIWindow? { get }
    
    func toMovieListScreen()
    func showLogin(window: UIWindow?, router: LoginRouting)
}

class LoginRouter: LoginRouting {
    weak var loginView: LoginView?
    weak var window: UIWindow?
    
    func showLogin(window: UIWindow?, router: LoginRouting) {
        self.window = window
        
        window?.rootViewController = LoginFactory.create(router: router)
        window?.makeKeyAndVisible()
    }
    
    func toMovieListScreen() {
        let moviesRouter = MainRouterFactory.shared.makeMoviesRouter()
        
        guard let window = window else { return }
        moviesRouter.start(window: window, router: moviesRouter)
    }
}
