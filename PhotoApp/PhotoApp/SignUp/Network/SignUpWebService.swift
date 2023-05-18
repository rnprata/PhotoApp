//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 17/05/23.
//

import Foundation

class SignUpWebService: SignUpWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignUpFormRequestModel, completionHandler: @escaping(SignUpResponseModel?, SignUpError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignUpError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            if let requestError = error {
                completionHandler(nil, SignUpError.failedRequest(
                    description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signUpResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                completionHandler(signUpResponseModel, nil)
            } else {
                completionHandler(nil, SignUpError.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
    
}
