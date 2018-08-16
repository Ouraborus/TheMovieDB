//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var MoviesCollection: UICollectionView!
    var collectionData: [UIImage] = []
        var movies: [[String: Any]] = [[String: Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Calling API
        MovieFacade.fetchTopRatedMovies(){ response in
            print("Top Rated Movies: ", response!)
        }
        
        MoviesCollection.dataSource = self
        MoviesCollection.delegate = self
        
        let width = (view.frame.size.width - 16) / 3
        let layout = MoviesCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionViewCell
        cell.movieImage.image = collectionData[indexPath.item]
        return cell
    }
}

