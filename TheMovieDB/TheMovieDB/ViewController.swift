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
    let jsonUrlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
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
        
    func callAPI() {
        Alamofire.request(self.jsonUrlString).responseJSON { response in
//            if let responseValue = response.result.value as? [String: Any] {
//                if let responseResult = responseValue["results"] as? [[String: Any]] {
//                    self.movies = responseResult
//                    self.downloadImages()
//                    }
//                }
            
            if let responseValue = response.result.value as? [String: Any] {
                let top = TopRated(jsonData: responseValue)
            print(top.results[0].overview)
            }
            
        }
    }
    
    func downloadImages(){
        let url = "https://image.tmdb.org/t/p/w500"
        //[indexPath.item]["poster_path"]
//        print(self.movies)
        self.movies.forEach( { movie in
            Alamofire.request(URL(string: url + String(describing: movie["poster_path"]!))!)
            .responseImage(completionHandler: {(response) in
                if let image = response.result.value {
                    self.collectionData.append(image)
                    self.MoviesCollection.reloadData()
                }
            })
        })
    }
    
}

