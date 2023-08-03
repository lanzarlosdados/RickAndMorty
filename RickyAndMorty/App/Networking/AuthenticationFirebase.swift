//
//  AuthenticationFirebase.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation
import FirebaseAuth

final class AuthenticationFirebase{
    
     static func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creando un new user", error.localizedDescription)
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("Usuario creado con el email: \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
}

