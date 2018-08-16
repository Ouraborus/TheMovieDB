//
//  MovieFacade.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

class MovieFacade {
    static func fetchTopRatedMovies(completion: @escaping (TopRated?) -> ()) {
        MovieDBFetcher.fetchTopRated() { response in
            completion(response)
        }
    }
    
}
