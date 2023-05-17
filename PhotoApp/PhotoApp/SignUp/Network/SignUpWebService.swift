//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 17/05/23.
//

import Foundation

class SignUpWebService {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignUpFormRequestModel, completionHandler: @escaping(SignUpResponseModel?, SignUpErrors?) -> Void) {
        guard let url = URL(string: urlString) else {
            // TODO: create a unit test to test that specific error message is returned is URL is nil
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            // TODO: write a new unit test to handle and error here
            
            if let data = data, let signUpResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                completionHandler(signUpResponseModel, nil)
            } else {
                // TODO: create a new unit test to handle an error here
            }
        }
        dataTask.resume()
    }
    
}
