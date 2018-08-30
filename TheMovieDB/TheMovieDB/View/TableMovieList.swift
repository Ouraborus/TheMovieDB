//
//  TableMovieList.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

class TableMovieList: UITableView, UITableViewDataSource,UITableViewDelegate, MovieList /*,MovieDetailDelegate*/  {
//    var movieDetailDelegate: MovieDetail?
    var moviesListDelegate: MovieListDelegate?
 
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        self.dataSource = self
        self.delegate = self
        self.rowHeight = UITableViewAutomaticDimension
        self.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (moviesListDelegate?.numberOfItems())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! ListCell
        moviesListDelegate?.configure(cell: cell, atIndexPath: indexPath)
        return cell as! UITableViewCell
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        moviesListDelegate?.movieDetailView(movieIndex: indexPath)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
            moviesListDelegate?.fetchNewData()
        }
    }
}
