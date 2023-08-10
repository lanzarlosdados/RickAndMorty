//
//  GoogleAuthentication.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 10/08/2023.
//
import UIKit
import Foundation
import GoogleSignIn

final class GoogleAuthentication {
    
    func loginGoogle(viewController: UIViewController,completionBlock: @escaping (Result<GIDGoogleUser, Error>) -> Void){
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            if let error = error {
                print("Error whit login facebook\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            if let user = result?.user {
                completionBlock(.success(user))
            }
        }
    }
}

