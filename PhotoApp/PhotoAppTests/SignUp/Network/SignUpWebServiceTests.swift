//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 17/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpWebServiceTests: XCTestCase {

    var sut: SignUpWebService!
    var signUpFormRequestModel: SignUpFormRequestModel!
    
    override func setUp() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignUpWebService(urlString: SignUpConstants.signUpURLString,
                               urlSession: urlSession)

        signUpFormRequestModel = SignUpFormRequestModel(
            firstName: "Rayana",
            lastName: "Prata",
            email: "teste@teste.com",
            password: "SenhaSegura123")
    }

    override func tearDown() {
        sut = nil
        signUpFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testSignUpWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
            // Assert
            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
            // Assert
            XCTAssertNil(signUpResponseModel,
                         "The response model for a request containing unknown JSON response, should have been nil")
            
            XCTAssertEqual(error, SignUpErrors.responseModelParsingError,
                           "The signup() method did not return expected error for an responseModelParsingError error")
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignUpWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { signUpRespondeModel, error in
            
            // Assert
            XCTAssertNil(signUpRespondeModel,
                         "When an invalidRequestURLStringError takes place, the response model must be nil")
            
            XCTAssertEqual(error, SignUpErrors.invalidRequestURLStringError,
                           "The signup() method did not return expected error for an invalidRequestURLStringError error")
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }

}
