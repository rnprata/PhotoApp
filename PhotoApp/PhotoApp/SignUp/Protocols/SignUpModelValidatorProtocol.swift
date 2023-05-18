//
//  SignUpModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import Foundation

protocol SignUpModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
