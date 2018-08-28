//
//  CollectionMovieList.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

class CollectionMovieList: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, MovieList  {
    var moviesListDelegate: MovieListDelegate?
    
    init(layout: UICollectionViewLayout) {
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (moviesListDelegate?.numberOfItems())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! ListCell
        moviesListDelegate?.configure(cell: cell, atIndexPath: indexPath)
        return cell as! UICollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moviesListDelegate?.movieDetailView(movieIndex: indexPath)
    }
}

