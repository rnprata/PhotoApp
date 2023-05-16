//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 15/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpFormModelValidatorTests: XCTestCase {

    var sut: SignUpFormModelValidator!
    
    override func setUp() {
        sut = SignUpFormModelValidator()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Rayana")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "R")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter then two characters, but it has returned TRUE")
    }

}
