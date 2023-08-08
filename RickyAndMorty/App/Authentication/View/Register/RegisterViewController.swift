//
//  RegisterViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var confirmPassError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var registerButtom: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    lazy var viewModel = AuthenticationViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTextField()
        resetForm()
    }
    
    private func configTextField() {
        email.addTarget(self, action: #selector(handleEmailChange), for: .editingChanged)
        password.addTarget(self, action: #selector(handlePassChange), for: .editingChanged)
        confirmPassword.addTarget(self, action: #selector(handleConfirmPassChange), for: .editingChanged)
        password.enablePasswordToggle()
        confirmPassword.enablePasswordToggle()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        print("touch btn")
        if let email = email.text, let password = password.text {
            viewModel.createNewUser(email: email, password: password )
        }
    }
    
    @objc fileprivate func handleEmailChange() {
        if let email = email.text {
            if let errorMessage = ValidateForm.invalidEmail(email)
                    {
                        emailError.text = errorMessage
                        emailError.isHidden = false
                    }
                    else
                    {
                        emailError.isHidden = true
                    }
                }
        checkForValidForm()
    }
    
    @objc fileprivate func handlePassChange() {
        if let password = password.text
        {
            let errorMessage = ValidateForm.invalidPassword(password)
            
                if errorMessage != ""
                {
                    passwordError.text = errorMessage
                    passwordError.isHidden = false
                }
                else
                {
                    passwordError.isHidden = true
                }
            }
        checkForValidForm()
    }
    
    @objc fileprivate func handleConfirmPassChange() {
        if let password = password.text,
           let confirmPass = confirmPassword.text
                {
            if let errorMessage = ValidateForm.passwordIsEquals(password, confirmPass)
                    {
                        confirmPassError.text = errorMessage
                        confirmPassError.isHidden = false
                    }
                    else
                    {
                        confirmPassError.isHidden = true
                    }
                }
                
                checkForValidForm()
    }
    
    
    func checkForValidForm() {
            if emailError.isHidden && passwordError.isHidden && confirmPassError.isHidden
            {
                registerButtom.isEnabled = true
            }
            else
            {
                registerButtom.isEnabled = false
            }
        print(registerButtom.isEnabled as Any)
        }
    
    func resetForm() {
            registerButtom.isEnabled = false
            emailError.isHidden = false
            passwordError.isHidden = false
            confirmPassError.isHidden = false
            email.text = ""
            password.text = ""
            confirmPassword.text = ""
        }
}

extension RegisterViewController: UserViewProtocol {
    
    func getUser(user: User) {
        print("user\(user.email)")
        resetForm()
        navigationController?.pushViewController(TabBar(), animated: true)
    }

}
