//
//  SignUpViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 22/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignUpViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }

    func testSignUpViewController_WhenCreated_HasrequiredTextFieldsEmpty() throws {
        
        let firstNameTextField = try XCTUnwrap(
            sut.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(
            sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(
            sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(
            sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(
            sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(
            firstNameTextField.text, "",
            "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            lastNameTextField.text, "",
            "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            emailTextField.text, "",
            "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            passwordTextField.text, "",
            "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            repeatPasswordTextField.text, "",
            "Repeat Password text field was not empty when the view controller initially loaded")
    }
    
    func testSignUpViewController_WhenCreated_HasSignUpButtonAndAction() throws {
        // Arrange
        let signUpButton: UIButton = try XCTUnwrap(
            sut.signUpButton, "signUpButton does not have a referencing outlet")
        
        // Act
        let signUpButtonActions = try XCTUnwrap(signUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "signUpButton does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(signUpButtonActions.count, 1)
        XCTAssertEqual(signUpButtonActions.first, "signUpButtonTapped:",
                      "There is no action with a name signUpButtonTapped assigned to signUpButton")
    }

}
