//
//  MockSignUpViewDelegate.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignUpViewDelegate: SignUpViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var successfullSignUpCounter = 0
    var errorHandlerCounter = 0
    var signUpError: SignUpError?
    
    func successfullSignUp() {
        successfullSignUpCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignUpError) {
        signUpError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
}
