//
//  MovieFacade.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire

class MovieFacade {
    static var page = 1
    static var movieDBUrl = "https://image.tmdb.org/t/p/w500"
    static let fallbackPoster = "http://www.theprintworks.com/wp-content/themes/psBella/assets/img/film-poster-placeholder.png"
    static let fallbackBackdrop = "http://support.anymeeting.com/customer/portal/attachments/192031"
    
    static func fetchTopRatedMovies(completionHandler: @escaping (TopRated, String) -> ()) {
        let jsonUrlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=\(page)"
        Alamofire.request(jsonUrlString).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let responseValue = response.result.value as? [String: Any] {
                    completionHandler(TopRated(jsonData: responseValue), "Error")
                    page += 1
                }
            case .failure/*(let error)*/:
                completionHandler(TopRated(jsonData: Dictionary<String, Any>()), "Error")
            }
        }
    }
}
//{
//    "status_code": 7,
//    "status_message": "Invalid API key: You must be granted a valid key."
//}

