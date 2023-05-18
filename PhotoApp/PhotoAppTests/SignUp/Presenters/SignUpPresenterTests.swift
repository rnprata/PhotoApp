//
//  SignUpPresenterTests.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        let signUpFormModel = SignUpFormModel(firstName: "Rayana",
                                              lastName: "Prata",
                                              email: "teste@teste.com",
                                              password: "SenhaSegura123",
                                              repeatPassword: "SenhaSegura123")
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let sut = SignUpPresenter(formModelValidator: mockSignUpModelValidator)
        
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        
        // Assert
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }
    
    func testSignUpPresenter_When_() {
        // Arrange
        
        // Act
        
        // Assert
    }

}
