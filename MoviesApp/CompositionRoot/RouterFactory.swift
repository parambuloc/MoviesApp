//
//  RouterFactory.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

protocol RouterFactory {
    func makeLoginRouter() -> LoginRouting
    func makeMoviesRouter() -> MoviesRouting
}
