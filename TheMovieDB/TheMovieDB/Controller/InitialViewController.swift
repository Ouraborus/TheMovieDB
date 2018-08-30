//
//  InitialViewController.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//
import UIKit
class InitialViewController: UIViewController {
    var list: MovieList!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .pad  {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            let width = (view.frame.size.width - 24) / 3
            layout.itemSize = CGSize(width: width, height: width * 1.5)
            self.list = CollectionMovieList(layout: layout)
        } else {
            self.list = TableMovieList()
        }
        self.list.moviesListDelegate = self
        self.view.addSubview((self.list as! UIView))
        //Interacting with Facade
        MovieFacade.fetchTopRatedMovies(){ [weak self] response in
            self?.movies = response.results
            self?.list.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        (self.list as! UIView).frame = self.view.bounds
    }
}
extension InitialViewController: MovieListDelegate {
    
    func movieDetailView(movieIndex:  IndexPath) {
        let detailView = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        //Set movie data at MovieDetailViewController
        detailView.movie = movies[movieIndex.item]
        //Push VC in the NavController
        self.navigationController!.pushViewController(detailView, animated: true)
    }
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: ListCell, atIndexPath: IndexPath) {
        cell.movieTitle.text = movies[atIndexPath.item].title
        cell.movieImage.af_setImage(withURL: movies[atIndexPath.item].poster_path, placeholderImage: UIImage(named: "movie_placeholder"), imageTransition: .crossDissolve(0.3))
    }
    
    func fetchNewData() {
        MovieFacade.fetchTopRatedMovies(){ [weak self] response in
            self?.movies.append(contentsOf: response.results)
            self?.list.reloadData()
        }
    }
}
