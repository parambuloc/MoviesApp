//
//  MovieCellView.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import UIKit

class MovieCellView: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(movie: MovieCellViewModel) {
        movieImageView.setImage(from: movie.imageURL, placeholder: #imageLiteral(resourceName: "ic_movie.svg"))
        movieName.text = movie.title
        movieDescription.text = movie.overview
    }
    
}
