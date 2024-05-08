//
//  MainRouterFactory.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

class MainRouterFactory: RouterFactory {
    static let shared = MainRouterFactory()
    
    private init() {}
    
    func makeLoginRouter() -> LoginRouting {
        return LoginRouter()
    }
    
    func makeMoviesRouter() -> MoviesRouting {
        return MoviesRouter()
    }
}
