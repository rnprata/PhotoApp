//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 15/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        let sut = SignUpFormModelValidator()
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Rayana")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }

}
