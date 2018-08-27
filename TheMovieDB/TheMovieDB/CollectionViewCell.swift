//
//  CollectionViewCell.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, ListCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
}
