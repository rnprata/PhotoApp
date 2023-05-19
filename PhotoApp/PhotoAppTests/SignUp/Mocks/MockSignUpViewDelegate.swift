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
    
    func successfullSignUp() {
        successfullSignUpCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignUpError) {
        //
    }
}
