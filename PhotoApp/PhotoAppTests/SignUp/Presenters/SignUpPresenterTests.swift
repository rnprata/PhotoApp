//
//  SignUpPresenterTests.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpPresenterTests: XCTestCase {

    var signUpFormModel: SignUpFormModel!
    var mockSignUpModelValidator: MockSignUpModelValidator!
    var mockSignUpWebService: MockSignUpWebService!
    var sut: SignUpPresenter!
    
    override func setUp() {
        signUpFormModel = SignUpFormModel(firstName: "Rayana",
                                              lastName: "Prata",
                                              email: "teste@teste.com",
                                              password: "SenhaSegura123",
                                              repeatPassword: "SenhaSegura123")
        mockSignUpModelValidator = MockSignUpModelValidator()
        mockSignUpWebService = MockSignUpWebService()
        sut = SignUpPresenter(formModelValidator: mockSignUpModelValidator, webService: mockSignUpWebService)
    }

    override func tearDown() {
        signUpFormModel = nil
        mockSignUpModelValidator = nil
        mockSignUpWebService = nil
        sut = nil
    }

    func testSignUpPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        
        // Assert
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }
    
    func testSignUpPresenter_WhenGivenValidFormModel_ShouldCallSignUpMethod() {
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        
        // Assert
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled, "The signUp() method was not called in the SignUpWebService class")
    }
    
    func testSignUpPresenter_When_() {
        // Arrange
        
        // Act
        
        // Assert
    }

}
