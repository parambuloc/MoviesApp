//
//  DetailMovieView.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 7/05/24.
//

import UIKit

protocol DetailMovieUI: AnyObject {
    func update(movie: DetailMovieViewModel)
}

class DetailMovieView: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieVoteAverage: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    private let presenter: DetailMoviePresentable
    
    init(presenter: DetailMoviePresentable) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.onViewAppear()
    }

}

extension DetailMovieView: DetailMovieUI {
    
    func update(movie: DetailMovieViewModel) {
        moviePoster.setImage(from: movie.posterPath, placeholder: #imageLiteral(resourceName: "ic_movie.svg"))
        movieName.text = movie.title
        movieDescription.text = movie.overview
        movieVoteAverage.text = movie.voteAverage.description
        movieReleaseDate.text = movie.releaseDate
    }
    
}
