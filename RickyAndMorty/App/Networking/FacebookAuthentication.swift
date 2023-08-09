//
//  FacebookAuthentication.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 09/08/2023.
//

import Foundation
import FacebookLogin

final class FacebookAuthentication {
    
    let loginManager = LoginManager()
    
    func loginFacebook(completionBlock: @escaping (Result<String, Error>) -> Void){
        loginManager.logIn(permissions: ["email"],
                           from: nil) { loginManagerLoginResult, error in
            if let error = error {
                print("Error whit login facebook\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let token = loginManagerLoginResult?.token?.tokenString
            completionBlock(.success(token ?? "Empty token"))
        }
    }
}
