//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var popularity: UILabel!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePoster.af_setImage(withURL:(movie?.backdrop_path)!, imageTransition: .crossDissolve(0.3))
        movieImage.af_setImage(withURL: (movie?.poster_path)!)
        movieTitle.text = movie?.title
        movieOverview.text = movie?.overview
        voteCount.text = "Vote Count: \(movie?.vote_count ?? 0)"
        voteAverage.text = "Vote Average: \(movie?.vote_average ?? 0)"
        releaseDate.text = "Release Date: \(movie?.release_date ?? "Not Avaiable")"
        popularity.text = "Popularity: \(movie?.popularity ?? 0)"
        
    }
}

