//
//  MockSignUpWebService.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import Foundation
@testable import PhotoApp

class MockSignUpWebService: SignUpWebServiceProtocol {
    
    var isSignUpMethodCalled: Bool = false
    
    func signup(withForm formModel: PhotoApp.SignUpFormRequestModel, completionHandler: @escaping (PhotoApp.SignUpResponseModel?, PhotoApp.SignUpError?) -> Void) {
        isSignUpMethodCalled = true
    }
}
