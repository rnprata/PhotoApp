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
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: PhotoApp.SignUpFormRequestModel, completionHandler: @escaping (PhotoApp.SignUpResponseModel?, PhotoApp.SignUpError?) -> Void) {
        isSignUpMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignUpError.failedRequest(description: "SignUp request was not successfull"))
        } else {
            let responseModel = SignUpResponseModel(status: "ok")
            completionHandler(responseModel,nil)
        }
    }
}
