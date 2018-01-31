//
//  AdvertismentsPresenterTests.swift
//  AdvertismentsTests
//
//  Created by Mohamed Waly on 31.01.18.
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//

import XCTest

class AdvertismentsPresenterTests: XCTestCase {
    
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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


    /*
     var currentPage: Int { get }

    func loadAdvertisments(starting page: Int)
    var numberOfAds: Int { get }
    func adsDidLoad(newAds: [T])
    func errorOccured(error: Error)
    */

    func test_WhenLoadPageCalled_currentPageIncremented() {}
    func test_WhenLoadPageCalled_numberOfAdsUpdated() {}
    func test_WhenLoadPageCalled_numberOfAdsUpdated() {}
    func test_WhenNetworkErrorCalled_errorHandled() {}
    func test_WhenPollsFinished_errorHandled() {}


}
