//
//  LoginViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 29/07/2023.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var login: UIButton!
    lazy var viewModel = AuthenticationViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        email.delegate = self
        viewModel.getCurrentUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func loginAction(_ sender: Any) {
        if let email = email.text, let password = password.text {
            viewModel.login(email: email, password: password )
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func resetForm() {
            login.isEnabled = false
            emailError.isHidden = true
            email.text = ""
            password.text = ""
        }
    
    func checkForValidForm() {
        login.isEnabled = emailError.isHidden
    }
}
extension LoginViewController :  UserViewProtocol, UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let email = textField.text {
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
    
    func getUser(user: User) {
        print("user login", user)
        resetForm()
        let vc = TabBar()
        navigationController?.pushViewController(vc, animated: true)
    }
}
