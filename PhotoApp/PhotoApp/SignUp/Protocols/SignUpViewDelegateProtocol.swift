//
//  SignUpViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 19/05/23.
//

import Foundation

protocol SignUpViewDelegateProtocol: AnyObject {
    func successfullSignUp()
    func errorHandler(error: SignUpError)
}
