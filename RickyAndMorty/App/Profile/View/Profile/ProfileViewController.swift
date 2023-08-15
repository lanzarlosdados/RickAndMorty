//
//  ProfileViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 07/08/2023.
//
import Foundation
import UIKit
import Combine

final class ProfileViewController: BaseViewController, BaseViewProtocol{
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var name: UILabel!
    var viewModel = ProfileViewModel()
    private var anyCancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        subscriptions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getCurrentUser()
    }
    
    private func subscriptions(){
           viewModel.postObservable.sink { error in
               print("error: ", error)
           } receiveValue: {[weak self] in
               self?.configUser()
           }.store(in: &anyCancellable)
       }
    
    func configUser(){
        if let user = viewModel.user {
            print("user", user)
            email.text = user.email
            name.text = user.displayName
            if let imageUrl = user.profileImageUrl {
                imageProfile.kf.setImage(with: imageUrl)
            }
        }
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
        navigationController?.pushViewController(EditProfileViewController(), animated: true)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        viewModel.logout()
        navigationController?.popToRootViewController(animated: true)
    }
}
