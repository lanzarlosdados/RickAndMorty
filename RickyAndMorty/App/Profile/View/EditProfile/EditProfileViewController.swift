//
//  EditProfileViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 11/08/2023.
//

import UIKit
import Combine

final class EditProfileViewController: BaseViewController, BaseViewProtocol {

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var editImage: UIButton!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    lazy var viewModel = ProfileViewModel()
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
            self.name.text = user.displayName
            if let imageUrl = user.profileImageUrl {
                imageProfile.kf.setImage(with: imageUrl)
            }
        }
    }
    
    @IBAction func editImageAction(_ sender: Any) {
        let picker = UIImagePickerController()
           picker.allowsEditing = true
           picker.delegate = self
           present(picker, animated: true)
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        if let name  = name.text,
           let image  = imageProfile.image
        {
            viewModel.updateUser(name: name,imageProfile: image)
        }
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.imageProfile.image = image
        dismiss(animated: true)
    }
}
