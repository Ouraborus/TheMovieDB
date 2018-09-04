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
    //    @IBOutlet weak var moviePoster: UIImageView!
    //    @IBOutlet weak var movieImage: UIImageView!
    //    @IBOutlet weak var movieTitle: UILabel!
    //    @IBOutlet weak var movieOverview: UITextView!
    //    @IBOutlet weak var voteCount: UILabel!
    //    @IBOutlet weak var voteAverage: UILabel!
    //    @IBOutlet weak var releaseDate: UILabel!
    //    @IBOutlet weak var popularity: UILabel!
    
    var moviePoster: UIImageView!
    var movieImage: UIImageView!
    var movieTitle: UILabel!
    var movieOverview: UITextView!
    var voteCount: UILabel!
    var voteAverage: UILabel!
    var releaseDate: UILabel!
    var popularity: UILabel!
    
    var movie: Movie?
    var initialConstraints = [NSLayoutConstraint]()
    override func viewDidLoad() {
        super.viewDidLoad()
        instanceElements()
        setUpElements()
        setUpConstraints()
        setViewElements()
        
    }
    func instanceElements() {
        moviePoster = UIImageView()
        movieImage = UIImageView()
        movieTitle = UILabel()
        movieOverview = UITextView()
        voteCount = UILabel()
        voteAverage = UILabel()
        releaseDate = UILabel()
        popularity = UILabel()
    }
    func setUpElements() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(movieTitle)
        self.view.addSubview(moviePoster)
        self.view.addSubview(movieImage)
        self.view.addSubview(movieOverview)
    }
    func setUpConstraints() {
        //MARK: MoviePoster
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        let moviePosterTopConstraint = moviePoster.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let moviePosterLeadingConstraint = moviePoster.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let moviePosterTrailingConstraint = moviePoster.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let moviePosterHeight = moviePoster.heightAnchor.constraint(equalToConstant: 230)
        self.view.sendSubview(toBack: moviePoster)
        
        //MARK: MovieTitle
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        let movieTitleTopConstraint = movieTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
        let movieTitleTrailingConstraint = movieTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -200)
        let movieTitleLeadingConstraint = movieTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        movieTitle.textColor = .white
        movieTitle.lineBreakMode = .byWordWrapping
        movieTitle.numberOfLines = 2
        
        //MARK: MovieImage
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        let movieImageTopConstraint = movieImage.topAnchor.constraint(equalTo: moviePoster.topAnchor, constant: 100)
        let movieImageTrailingConstraint = movieImage.trailingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: -80)
        let movieImageHeight = movieImage.heightAnchor.constraint(equalToConstant: 80)
        let movieImageWidth = movieImage.widthAnchor.constraint(equalToConstant: 50)
        movieImage.contentMode = UIViewContentMode.center
        
        //MARK: MovieOverview
        movieOverview.translatesAutoresizingMaskIntoConstraints = false
        let movieOverviewTopConstraint = movieOverview.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 20)
        let movieOverviewLeadingConstraint = movieOverview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let movieOverviewTrailingConstraint = movieOverview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        let movieOverviewHeight = movieOverview.heightAnchor.constraint(equalToConstant: 400)
//        let movieOverviewWidth = movieOverview.widthAnchor.constraint(equalToConstant: 50)
        
        
        
        
        initialConstraints = [moviePosterTopConstraint,
                              moviePosterLeadingConstraint,
                              moviePosterTrailingConstraint,
                              moviePosterHeight,
                              movieTitleTopConstraint,
                              movieTitleTrailingConstraint,
                              movieTitleLeadingConstraint,
                              movieImageTopConstraint,
                              movieImageWidth,
                              movieImageHeight,
                              movieImageTrailingConstraint,
                              movieOverviewTopConstraint,
                              movieOverviewLeadingConstraint,
                              movieOverviewTrailingConstraint,
                              movieOverviewHeight]
        NSLayoutConstraint.activate(initialConstraints)
    }
    func setViewElements() {
        moviePoster.af_setImage(withURL:(movie?.backdrop_path)!, imageTransition: .crossDissolve(0.3))
        movieImage.af_setImage(withURL: (movie?.poster_path)!)
        movieTitle.text = movie?.title
        movieOverview.text = movie?.overview
//        voteCount.text = "Vote Count: \(movie?.vote_count ?? 0)"
//        voteAverage.text = "Vote Average: \(movie?.vote_average ?? 0)"
//        releaseDate.text = "Release Date: \(movie?.release_date ?? "Not Avaiable")"
//        popularity.text = "Popularity: \(movie?.popularity ?? 0)"
    }
}

