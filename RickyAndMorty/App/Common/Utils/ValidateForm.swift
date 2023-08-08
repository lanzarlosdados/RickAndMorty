//
//  ValidateForm.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 07/08/2023.
//

import Foundation

class ValidateForm {
    
    static func invalidEmail(_ value: String) -> String? {

        if !value.isValid(.email)
        {
            return "Invalid Email Address"
        }
        return nil
    }
}
