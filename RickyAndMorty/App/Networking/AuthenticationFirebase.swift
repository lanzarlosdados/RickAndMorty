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
                completionBlock(.failure(error))
                return
            }
            completionBlock(.success(.init(email: email)))
        }
    }
    static func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
       
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
           if let error = error {
               completionBlock(.failure(error))
               return
           }
           completionBlock(.success(.init(email: email)))
       }
   }
}

