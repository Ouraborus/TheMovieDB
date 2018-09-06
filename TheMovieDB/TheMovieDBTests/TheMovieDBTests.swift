//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Esteban Cardona Alvarez on 9/5/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB
class TheMovieDBTests: XCTestCase {
    var initialVC: InitialViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = "InitialViewController"
        
        initialVC = storyboard.instantiateViewController(withIdentifier: identifier) as! InitialViewController
        _ = initialVC.view
    }
        
    func testInitialVC_mustBeSet() {
        XCTAssert(initialVC.list != nil)
    }
    func testInitialVC_delegateMustBeSet() {
        XCTAssert(initialVC.list.moviesListDelegate != nil)
    }
    
        
        //        func testInitialVC_properView() {
        //            if UIDevice.current.userInterfaceIdiom == .pad  {
        //                let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //                XCTAssert(TheMovieDB.InitialViewController().list === CollectionMovieList(layout: layout))
        //                print("DESCRIPCION!!!1!!!!", TheMovieDB.InitialViewController().list)
        //            } else {
        //    //            print("DESCRIPCION!!!2!!!!", TheMovieDB.InitialViewController().list.description)
        //                print("DESCRIPCION!!!3!!!!", TableMovieList().description)
        //                XCTAssert(TheMovieDB.InitialViewController().list === TableMovieList())
        //            }
        //        }
}
