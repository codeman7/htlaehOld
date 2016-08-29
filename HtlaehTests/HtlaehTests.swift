//
//  HtlaehTests.swift
//  HtlaehTests
//
//  Created by Cody Weaver on 8/1/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import XCTest
@testable import Htlaeh

class HtlaehTests: XCTestCase {
    
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
      
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
   
   func testLayout() {
      let home: Home = Home()
      let a = ActiveSetView(view: home.view, titles: [.top : (hint: SetVariable.Exercise, label: home.workout![0].name), .left : (hint: SetVariable.Reps, label: "\(home.workout![0].reps!)"), .right : (hint: SetVariable.Weight, label: "\(Int(home.workout![0].weight!))")])
      print("\(a.topHint.frame.origin.y)\n\n\n\n\n\n\n")
      XCTAssertNotNil(a.topHint)
   }
    
}
