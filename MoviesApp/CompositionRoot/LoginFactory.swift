//
//  LoginFactory.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class LoginFactory {
    static func create(router: LoginRouting) -> LoginView {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(router: router,
                                       loginInteractor: interactor)
        let loginView = LoginView(presenter: presenter)
        presenter.ui = loginView
        
        return loginView
    }
}
