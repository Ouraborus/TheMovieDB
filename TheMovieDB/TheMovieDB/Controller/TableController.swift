//
//  TableController.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/22/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var MoviesTable: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoviesTable.dataSource = self
        MoviesTable.delegate = self
        
        //Interacting with Facade
        MovieFacade.fetchTopRatedMovies(){ [weak self] response in
            self?.movies = response.results
            self?.MoviesTable.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.movieImage.af_setImage(withURL: movies[indexPath.item].poster_path, placeholderImage: UIImage(named: "movie_placeholder"), imageTransition: .crossDissolve(0.3))
        cell.movieTitle.text = movies[indexPath.item].title
        return cell
    }
    
    
}

