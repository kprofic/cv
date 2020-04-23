//
//  cvUITests.swift
//  cvUITests
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import XCTest

class cvUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFullNameLabelAppearsOnAppLoad() {
        // Arrange
        let app = XCUIApplication()
        app.launch()
     
        // Act
        let sut = app.staticTexts["fullname"]
        
        // Assert
        XCTAssert(sut.waitForExistence(timeout: 1))
    }
    

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
