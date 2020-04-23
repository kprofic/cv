//
//  ExperienceViewModelTests.swift
//  cvTests
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import XCTest
@testable import cv

class ExperienceViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExperiencePeriodIsMappedCorrectly() {
        // Arrange
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let start = dateFormatter.date(from: "2017-08-01T00:00:00Z")!
        let end = dateFormatter.date(from: "2019-09-30T00:00:00Z")!
        
        let exp = Experience(companyName: "fixture", companyLogoName: "fixture", position: "fixture", dateStarted: start, dateFinished: end)
        
        // Act
        let sut = ExperienceViewModelData(experience: exp)
        
        // Assert
        XCTAssertEqual(sut.periodDescription, "Aug 1, 2017 - Sep 30, 2019")
    }

    func testExperienceWithoutEndDateIsMappedAsPresent() {
        // Arrange
        let exp = Experience(companyName: "fixture", companyLogoName: "fixture", position: "fixture", dateStarted: Date(), dateFinished: nil)
        
        // Act
        let sut = ExperienceViewModelData(experience: exp)
        
        // Assert
        XCTAssertTrue(sut.periodDescription.hasSuffix("Present"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
