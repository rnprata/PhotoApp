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

    func testSignUpViewController_WhenCreated_HasrequiredTextFieldsEmpty() {
        XCTAssertEqual(
            sut.firstNameTextField.text, "",
            "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            sut.lastNameTextField.text, "",
            "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            sut.emailTextField.text, "",
            "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            sut.passwordTextField.text, "",
            "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(
            sut.repeatPasswordTextField.text, "",
            "Repeat Password text field was not empty when the view controller initially loaded")
    }

}
