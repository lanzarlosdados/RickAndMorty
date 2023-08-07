//
//  ProfileViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 07/08/2023.
//

import UIKit

class ProfileViewController: BaseViewController, UserViewProtocol {
    func getUser(user: User) {
        
    }
    
    
    lazy var viewModel = AuthenticationViewModel(delegate: self)

    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutAction(_ sender: Any) {
        viewModel.logout()
        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)

    }
    
}
