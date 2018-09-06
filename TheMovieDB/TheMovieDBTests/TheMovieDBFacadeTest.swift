//
//  TheMovieDBFacadeTest.swift
//  TheMovieDBTests
//
//  Created by Esteban Cardona Alvarez on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB
class TheMovieDBFacadeTest: XCTestCase {
    func testMovieFacade_countTotalResults(){
        //        let expectation = self.expectation(description: "MovieFacade")
        
        MovieFacade.fetchTopRatedMovies{ (topRated, error) in
            XCTAssertEqual(topRated.total_results, topRated.results.count)
            //                        expectation.fulfill()
        }
        //                waitForExpectations(timeout: 5, handler: nil)
    }
    
    //    func testMovieFacade_pageNeverZero() {
    //        XCTAssert(MovieFacade.page != 0)
    //    }
    
    func testMovieFacade_completionHandlerFailure() {
        MovieFacade.page = 0
        MovieFacade.movieDBUrl = "sadasd"
        MovieFacade.fetchTopRatedMovies{ (topRated, error) in
            XCTAssertEqual(topRated, TopRated(jsonData: Dictionary<String, Any>()))
            XCTAssert(error == "Error")
        }
    }
    
    func testMovieFacade_responseOrErrorNotNil() {
        MovieFacade.fetchTopRatedMovies{ (topRated, error) in
            XCTAssertNotNil(topRated)
            XCTAssertNotNil(error)
        }
    }
}
