//
//  SignUpPresenterProtocol.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 22/05/23.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    init(formModelValidator: SignUpModelValidatorProtocol,
         webService: SignUpWebServiceProtocol,
         delegate: SignUpViewDelegateProtocol)
    func processUserSignUp(formModel: SignUpFormModel)
}
