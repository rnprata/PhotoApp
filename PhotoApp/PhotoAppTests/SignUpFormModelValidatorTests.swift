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
    
    func testSignUpFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "short")
       
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter then \(SignUpConstants.passwordMinLength) characters, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "ThisPasswordIsTooLongerToBeAccepted123")
       
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer then \(SignUpConstants.passwordMaxLength) characters, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenPasswordWithoutUppercasedProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "senha123")
       
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password without uppercased, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenPasswordWithoutLowercasedProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "SENHA123")
       
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password without lowercased, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenPasswordWithoutDigitsProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "SenhaSegura")
       
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password without digits, but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
    }

}
