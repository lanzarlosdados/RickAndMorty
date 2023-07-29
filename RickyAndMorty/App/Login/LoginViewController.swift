//
//  LoginViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 29/07/2023.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        let vc = TabBar()
        show(vc, sender: nil)
    }
    
}
