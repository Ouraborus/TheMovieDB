//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var MoviesCollection: UICollectionView!
    var page = 1
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MoviesCollection.dataSource = self
        MoviesCollection.delegate = self
        //Interacting with Facade
        MovieFacade.fetchTopRatedMovies(page: String(describing: page)){ [weak self] response in
            self?.movies = response.results
            self?.MoviesCollection.reloadData()
        }
        
        //        Set the size of each collectionViewCell
        let width = (view.frame.size.width - 16) / 3
        let layout = MoviesCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionViewCell
        cell.movieImage.af_setImage(withURL: movies[indexPath.item].poster_path, placeholderImage: UIImage(named: "movie_placeholder"), imageTransition: .crossDissolve(0.3))
        return cell
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
            page += 1
            MovieFacade.fetchTopRatedMovies(page: String(describing: page)){ [weak self] response in
                self?.movies.append(contentsOf: response.results)
                self?.MoviesCollection.reloadData()
            }
            self.MoviesCollection.reloadData()
        }
    }
}

