//
//  String+ValidityType.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 07/08/2023.
//
import Foundation

enum ValidityType: String {
    case age = "[0-9]{2,2}"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{6,25}"
}

extension String {
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        let regex = validityType.rawValue
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

