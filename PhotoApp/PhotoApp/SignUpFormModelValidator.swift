//
//  SignUpFormModelValidator.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 15/05/23.
//

import Foundation

class SignUpFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
    
}