//
//  LoginPresenter.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import Foundation

protocol LoginPresentable: AnyObject {
    var ui: LoginUI? { get }
    func onTapLogin(user: String, password: String)
}

class LoginPresenter: LoginPresentable {
    weak var ui: LoginUI?
    
    private let user = "Admin"
    private let password = "Password*123"
    private let router: LoginRouting
    private let loginInteractor: LoginInteractable
    
    init(router: LoginRouting, loginInteractor: LoginInteractable) {
        self.router = router
        self.loginInteractor = loginInteractor
    }
    
    func onTapLogin(user: String, password: String) {
        if user == self.user && password == self.password {
            self.router.showMovieList()
        } else {
            ui?.showError()
        }
    }
}
