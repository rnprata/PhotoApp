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
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter then \(SignUpConstants.firstNameMinLength) characters, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "RayanaRayana")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer then \(SignUpConstants.firstNameMaxLength) characters, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Prata")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "P")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter then \(SignUpConstants.lastNameMinLength) characters, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Prata Neves Ribeiro da Silva Gomes")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer then \(SignUpConstants.lastNameMaxLength) characters, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Act
        let isEmailValid = sut.isEmailValid(email: "rayanaprata@uol.com.br")
        
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenEmailDoesNotContainTheDomain_ShouldReturnFalse() {
        // Act
        let isEmailInvalid = sut.isEmailValid(email: "rayanaprata@")
        
        // Assert
        XCTAssertFalse(isEmailInvalid, "The isEmailValid() should have returned FALSE when the email does not contain the domain but returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenEmailDoesNotContainAtSign_ShouldReturnFalse() {
        // Act
        let isEmailInvalid = sut.isEmailValid(email: "rayanapratauol.com")
        
        // Assert
        XCTAssertFalse(isEmailInvalid, "The isEmailValid() should have returned FALSE when the email does not contain the At sign but returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "Senha123")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenInvalidPasswordProvided_ShouldReturnFalse() {
        // Act
        let isShortPasswordInvalid = sut.isPasswordValid(password: "short")
        let isPasswordWithoutUppercaseInvalid = sut.isPasswordValid(password: "senha123")
        let isPasswordWithoutLowercaseInvalid = sut.isPasswordValid(password: "SENHA123")
        let isPasswordWithoutDigitInvalid = sut.isPasswordValid(password: "SenhaSegura")
        
        // Assert
        XCTAssertFalse(isShortPasswordInvalid, "The isPasswordValid() should have returned FALSE for a invalid password (length is too short) but returned TRUE")
        XCTAssertFalse(isPasswordWithoutUppercaseInvalid, "The isPasswordValid() should have returned FALSE for a invalid password (without uppercase) but returned TRUE")
        XCTAssertFalse(isPasswordWithoutLowercaseInvalid, "The isPasswordValid() should have returned FALSE for a invalid password (without lowercase) but returned TRUE")
        XCTAssertFalse(isPasswordWithoutDigitInvalid, "The isPasswordValid() should have returned FALSE for a invalid password (without digit) but returned TRUE")
    }

}
