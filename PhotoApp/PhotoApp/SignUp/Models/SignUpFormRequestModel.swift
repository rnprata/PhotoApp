//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 17/05/23.
//

import Foundation

struct SignUpFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
