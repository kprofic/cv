//
//  ProfileViewModelTests.swift
//  cvTests
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import XCTest
@testable import cv

class ProfileViewModelTests: XCTestCase {
    let profile = Profile(firstName: "FixtureName",
                          lastName: "FixtureLast",
                          positionName: "FixturePosition",
                          experience: 666,
                          linkedInUrl: URL(string: "https://www.example.com")!)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFullNameConstruction() {
        // Arrange
        let sut = ProfileViewModel(profile: profile)
        
        // Act
        // Assert
        XCTAssertEqual(sut.fullname, "FixtureName FixtureLast")
    }
    
    func testSubtitleConstruction() {
        // Arrange
        let sut = ProfileViewModel(profile: profile)
        
        // Act
        // Assert
        XCTAssertEqual(sut.subtitle, "FixturePosition with 666 years of experience")
    }
    
    func testLinkedInUrlMatches() {
        // Arrange
        let sut = ProfileViewModel(profile: profile)
        
        // Act
        // Assert
        XCTAssertEqual(sut.linkedInURL, profile.linkedInUrl)
    }
}
