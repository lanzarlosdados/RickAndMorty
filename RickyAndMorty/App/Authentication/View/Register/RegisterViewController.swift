//
//  RegisterViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var registerButtom: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    lazy var viewModel = AuthenticationViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if let email = email.text, let password = password.text {
            viewModel.createNewUser(email: email, password: password )
        }
    }
    
}

extension RegisterViewController: UserViewProtocol {
    
    func getUser(user: User) {
        print("user\(user.email)")
        navigationController?.pushViewController(TabBar(), animated: true)
    }

}
