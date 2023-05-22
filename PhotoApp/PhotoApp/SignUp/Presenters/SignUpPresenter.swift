//
//  SignUpPresenter.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 18/05/23.
//

import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    
    private var formModelValidator: SignUpModelValidatorProtocol
    private var webService: SignUpWebServiceProtocol
    private var delegate: SignUpViewDelegateProtocol?
    
    required init(formModelValidator: SignUpModelValidatorProtocol,
         webService: SignUpWebServiceProtocol,
         delegate: SignUpViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
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
        
        let requestModel = SignUpFormRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)
        
        webService.signup(withForm: requestModel) { responseModel, error in
            if let error = error {
                self.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self.delegate?.successfullSignUp()
                return
            }
        }
        
    }
    
}
