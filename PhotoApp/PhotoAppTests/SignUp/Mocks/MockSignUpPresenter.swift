//
//  MockSignUpPresenter.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 22/05/23.
//

import Foundation
@testable import PhotoApp

class MockSignUpPresenter: SignUpPresenterProtocol {
    
    var processUserSignUpCalled: Bool = false
    
    required init(formModelValidator: SignUpModelValidatorProtocol,
                  webService: SignUpWebServiceProtocol,
                  delegate: SignUpViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        processUserSignUpCalled = true
    }
}
