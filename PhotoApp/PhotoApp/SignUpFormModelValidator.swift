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
        
        if firstName.count < SignUpConstants.firstNameMinLength ||
            firstName.count > SignUpConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignUpConstants.lastNameMinLength ||
            lastName.count > SignUpConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailValid(email: String) -> Bool {
        // Regex pattern for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        // Create NSPredicate with the email regex
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        // Evaluate the predicate with the email string
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let hasLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let hasDigit = password.rangeOfCharacter(from: .decimalDigits) != nil
        
        return password.count >= SignUpConstants.passwordMinLength && hasUppercase && hasLowercase && hasDigit
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
}
