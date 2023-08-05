//
//  LoginViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 29/07/2023.
//

import UIKit

class LoginViewController: BaseViewController {
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var login: UIButton!
    lazy var viewModel = AuthenticationViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
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
}
extension LoginViewController :  UserViewProtocol {
    
    func getUser(user: User) {
        print("user login", user)
//        viewModel.logout()
        let vc = TabBar()
        navigationController?.pushViewController(vc, animated: true)
    }
}
