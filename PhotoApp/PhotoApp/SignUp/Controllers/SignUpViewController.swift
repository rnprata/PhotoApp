//
//  SignUpViewController.swift
//  PhotoApp
//
//  Created by Rayana Prata Neves on 22/05/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var signUpPresenter: SignUpPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if signUpPresenter == nil {
            
            let signUpModelValidator = SignUpFormModelValidator()
            let signUpWebService = SignUpWebService(urlString: SignUpConstants.signUpURLString)
            
            signUpPresenter = SignUpPresenter(
                formModelValidator: signUpModelValidator,
                webService: signUpWebService,
                delegate: self)
        }
        
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        let signUpFormModel = SignUpFormModel(
            firstName: firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? "",
            repeatPassword: repeatPasswordTextField.text ?? "")
        signUpPresenter?.processUserSignUp(formModel: signUpFormModel)
    }
}

extension SignUpViewController: SignUpViewDelegateProtocol {
    func successfullSignUp() {
        // TODO:
    }
    
    func errorHandler(error: SignUpError) {
        // TODO:
    }
}
