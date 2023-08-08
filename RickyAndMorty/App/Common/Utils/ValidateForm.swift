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
    
    static func invalidPassword(_ value: String) -> String?
        {
            var messageError = ""
            if value.count < 8
            {
                messageError += "Password must be at least 8 characters\n"
            }
            if !value.isValid(.containsDigit)
            {
                messageError +=  "Password must contain at least 1 digit\n"
            }
            if !value.isValid(.containsLowerCase)
            {
                messageError +=  "Password must contain at least 1 lowercase character\n"
            }
            if !value.isValid(.containsUpperCase)
            {
                messageError +=  "Password must contain at least 1 uppercase character"
            }
            return messageError
        }
    
    static func passwordIsEquals(_ password: String,_ confirmPassword: String ) -> String? {
        if !(password == confirmPassword) {
            return "Passwords must be equals"
        }
        return nil
    }
}
