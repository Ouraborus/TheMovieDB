//
//  MovieFacade.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class MovieFacade {
    static func fetchTopRatedMovies(page: String, completionHandler: @escaping (TopRated) -> ()) {
        let jsonUrlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=" + page        
        Alamofire.request(jsonUrlString).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let responseValue = response.result.value as? [String: Any] {
                    completionHandler(TopRated(jsonData: responseValue))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
