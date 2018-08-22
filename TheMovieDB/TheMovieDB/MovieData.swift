//
//  MovieData.swift
//  TheMovieDB
//
//  Created by Esteban Cardona Alvarez on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

struct TopRated {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
    
    init(jsonData: Dictionary<String, Any>) {
        self.page = jsonData["page"] as? Int ?? 0
        self.total_results = jsonData["total_results"] as? Int ?? 0
        self.total_pages = jsonData["total_pages"] as? Int ?? 0
        var result = [Movie]()
        if let moviesList = jsonData["results"] as? [[String: Any]] {
            result = moviesList.map(Movie.init(movie: ))
        }
        self.results = result
    }
}
struct Movie {
    let title: String
    let overview: String
    let vote_count: Int
    let vote_average: Double
    let poster_path: URL
    let release_date: String
    let backdrop_path: URL
    let popularity: Float
    
    
    init(movie: Dictionary<String, Any>) {
        self.title = movie["title"] as? String ?? ""
        self.overview = movie["overview"] as? String ?? ""
        self.vote_count = movie["vote_count"] as? Int ?? 0
        self.vote_average = movie["vote_average"] as? Double ?? 0.0
        self.poster_path = URL(string: "https://image.tmdb.org/t/p/w500" + String(describing: movie["poster_path"]!))!
        self.backdrop_path = URL(string: "https://image.tmdb.org/t/p/w500" + String(describing:movie["backdrop_path"]!))!
        self.release_date = movie["release_date"] as? String ?? ""
        self.popularity = movie["popularity"] as? Float ?? 0.000
    }

}

