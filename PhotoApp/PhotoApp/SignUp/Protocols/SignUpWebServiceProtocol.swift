//
//  SignUpWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signup(withForm formModel: SignUpFormRequestModel, completionHandler: @escaping(SignUpResponseModel?, SignUpError?) -> Void)
}
