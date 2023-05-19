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
    var mockSignUpViewDelegate: MockSignUpViewDelegate!
    var sut: SignUpPresenter!
    
    override func setUp() {
        signUpFormModel = SignUpFormModel(firstName: "Rayana",
                                              lastName: "Prata",
                                              email: "teste@teste.com",
                                              password: "SenhaSegura123",
                                              repeatPassword: "SenhaSegura123")
        mockSignUpModelValidator = MockSignUpModelValidator()
        mockSignUpWebService = MockSignUpWebService()
        mockSignUpViewDelegate = MockSignUpViewDelegate()
        sut = SignUpPresenter(formModelValidator: mockSignUpModelValidator,
                              webService: mockSignUpWebService,
                              delegate: mockSignUpViewDelegate)
    }

    override func tearDown() {
        signUpFormModel = nil
        mockSignUpModelValidator = nil
        mockSignUpWebService = nil
        mockSignUpViewDelegate = nil
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
    
    func testSignUpPresenter_WhenSignUpOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expect the successfullSignUp() method to be called")
        mockSignUpViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignUpViewDelegate.successfullSignUpCounter, 1,
                       "The successfullSignUp() method was called more than one time")
    }
    
    func testSignUpPresenter_WhenSignUpOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockSignUpViewDelegate.expectation = errorHandlerExpectation
        mockSignUpWebService.shouldReturnError = true
        
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignUpViewDelegate.successfullSignUpCounter, 0,
                       "The successfullSignUp() method was called")
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCounter, 1,
                       "The errorHandler() method was called more than one time")
        XCTAssertNotNil(mockSignUpViewDelegate.signUpError)
    }
    
}
