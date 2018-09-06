//
//  MovieDataTest.swift
//  TheMovieDBTests
//
//  Created by Esteban Cardona Alvarez on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB
class MovieDataTest: XCTestCase {
    var top_rated: TopRated!
    var movie: Movie!
    
    override func setUp() {
        super.setUp()
        top_rated = TopRated(jsonData: Dictionary<String, Any>())
        movie = Movie(movie: Dictionary<String, Any>())
        
    }
    func testMovieData_TopRated() {
        XCTAssert(top_rated.page == 0)
        XCTAssert(top_rated.total_results == 0)
        XCTAssert(top_rated.total_pages == 0)
        XCTAssertEqual(top_rated.results, [movie])
    }
    
    func testMovieData_resultsWithVoidInstance() {
        XCTAssert(movie.title == "")
        XCTAssert(movie.overview == "")
        XCTAssert(movie.vote_count == 0)
        XCTAssert(movie.vote_average == 0.0)
        XCTAssert(movie.poster_path == URL(string: TheMovieDB.MovieFacade.fallbackPoster))
        XCTAssert(movie.release_date == "")
        XCTAssert(movie.backdrop_path == URL(string: TheMovieDB.MovieFacade.fallbackBackdrop))
        XCTAssert(movie.popularity == 0.000)
    }
}
