//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Rayana Prata Neves on 17/05/23.
//

import XCTest
@testable import PhotoApp

final class SignUpWebServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUpWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignUpWebService(urlString: SignUpConstants.signUpURLString,
                                   urlSession: urlSession)
        
        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Rayana",
                                                            lastName: "Prata",
                                                            email: "teste@teste.com",
                                                            password: "SenhaSegura123")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
            // Assert
            //"(\"status\":\"ok\")"
            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
