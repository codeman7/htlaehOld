//
//  T.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/26/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import XCTest
@testable import Htlaeh

class T: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      let home = Home()
      print("\n\n\n\n\n\n\n")
      home.setupViews()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
   
   func hello() {
      let home = Home()
      print("\n\n\n\n\n\n\n")
      home.setupViews()
   }

}
