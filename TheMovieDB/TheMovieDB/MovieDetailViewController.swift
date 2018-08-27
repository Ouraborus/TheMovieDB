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
//protocol MovieDetail: class {
//    func showDetailsOf(movie: Movie)
//}
//protocol MovieDetailDelegate: class {
//    weak var movieDetailDelegate: MovieDetail? {get set}
//}

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.af_setImage(withURL: (movie?.poster_path)!)
        movieTitle.text = movie?.title
        movieOverview.text = movie?.overview
    }
}
//extension MovieDetailViewController: MovieDetail {
//    func showDetailsOf(movie: Movie) {
//        print(movie)
//    }
//}

