//
//  MovieListDelegate.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

//Protocol declaration
protocol MovieListDelegate: class {
    func numberOfItems() -> Int
    func configure(cell: ListCell, atIndexPath: IndexPath)
    func movieDetailView(movieIndex: IndexPath)
    func fetchNewData()
}

protocol ListCell: class {
    weak var movieTitle : UILabel! { get }
    weak var movieImage : UIImageView! { get }
}

protocol MovieList: class {
    weak var moviesListDelegate: MovieListDelegate? { get set }
    func reloadData()
}

