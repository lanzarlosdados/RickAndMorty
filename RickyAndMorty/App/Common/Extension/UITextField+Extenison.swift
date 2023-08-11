//
//  UITextField+PasswordToogle.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 08/08/2023.
//

import Foundation
import UIKit

extension UITextField {
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        button.tintColor = UIColor.black
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
    fileprivate func setEditToggleImage(_ button: UIButton) {
        if(!isEnabled){
            button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "pencil"), for: .normal)
        }
    }
    
    func enableEditToggle(){
        let button = UIButton(type: .custom)
        setEditToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.toggleEditView), for: .touchUpInside)
        button.tintColor = !isEnabled ? UIColor.green : UIColor.black
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @IBAction func toggleEditView(_ sender: Any) {
        self.isEnabled = !self.isEnabled
        setEditToggleImage(sender as! UIButton)
    }
}
