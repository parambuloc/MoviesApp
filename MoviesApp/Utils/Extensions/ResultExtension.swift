//
//  ResultExtension.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 8/05/24.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
