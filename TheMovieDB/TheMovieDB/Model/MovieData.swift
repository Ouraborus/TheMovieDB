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
        } else {
            result = [Movie(movie: Dictionary<String, Any>())]
        }
        self.results = result
    }
}
struct Movie {
    let title: String
    let overview: String
    let vote_count: Int
    let vote_average: Double
    let poster_path: URL!
    let release_date: String
    let backdrop_path: URL!
    let popularity: Float
    
    
    init(movie: Dictionary<String, Any>) {
        let poster_path = movie["poster_path"] != nil ? URL(string: MovieFacade.movieDBUrl + String(describing: movie["poster_path"]!))! : URL(string: MovieFacade.fallbackPoster)
        let backdrop_path = movie["backdrop_path"] != nil ? URL(string: MovieFacade.movieDBUrl + String(describing:movie["backdrop_path"]!))! : URL(string: MovieFacade.fallbackBackdrop)
        self.title = movie["title"] as? String ?? ""
        self.overview = movie["overview"] as? String ?? ""
        self.vote_count = movie["vote_count"] as? Int ?? 0
        self.vote_average = movie["vote_average"] as? Double ?? 0.0
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
        self.release_date = movie["release_date"] as? String ?? ""
        self.popularity = movie["popularity"] as? Float ?? 0.000
    }    
}
extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return
        lhs.title == rhs.title &&
        lhs.overview == rhs.overview &&
        lhs.vote_count == rhs.vote_count &&
        lhs.vote_average == rhs.vote_average &&
        lhs.poster_path == rhs.poster_path &&
        lhs.release_date == rhs.release_date &&
        lhs.backdrop_path == rhs.backdrop_path &&
        lhs.popularity == rhs.popularity        
    }
}
extension TopRated: Equatable {
    static func == (lhs: TopRated, rhs: TopRated) -> Bool {
        return
        lhs.page == rhs.page &&
        lhs.total_results == rhs.total_results &&
        lhs.total_pages == rhs.total_pages &&
        lhs.results == rhs.results
    }
}

