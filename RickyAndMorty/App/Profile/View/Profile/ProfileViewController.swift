//
//  ProfileViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 07/08/2023.
//

import UIKit

final class ProfileViewController: BaseViewController, UserViewProtocol {
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastName: UILabel!
    lazy var viewModel = AuthenticationViewModel(delegate: self)
    
    func getUser(user: User) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
        navigationController?.pushViewController(EditProfileViewController(), animated: true)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        viewModel.logout()
        navigationController?.popToRootViewController(animated: true)
    }
    
}
