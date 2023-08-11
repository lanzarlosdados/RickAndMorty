//
//  EditProfileViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 11/08/2023.
//

import UIKit

final class EditProfileViewController: BaseViewController {

    @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
