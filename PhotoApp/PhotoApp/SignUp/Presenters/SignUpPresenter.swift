//
//  SignUpPresenter.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import Foundation

class SignUpPresenter {
    
    private var formModelValidator: SignUpModelValidatorProtocol
    
    init(formModelValidator: SignUpModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
    }
    
}
