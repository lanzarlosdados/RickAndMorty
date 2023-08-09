//
//  AuthenticationFirebase.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation
import FirebaseAuth

final class AuthenticationFirebase{
    private let facebookAuth = FacebookAuthentication()

    func logOut() throws {
        try Auth.auth().signOut()
    }
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
       
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
           if let error = error {
               completionBlock(.failure(error))
               return
           }
           completionBlock(.success(.init(email: email)))
       }
   }

    func loginWhitFacebook(completionBlock: @escaping (Result<User,Error>) -> Void) {
        facebookAuth.loginFacebook { result in
            switch result {
            case .success(let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token)
                Auth.auth().signIn(with: credential) { authDataResult, error in
                    if let error = error {
                        print("error creating new user whit credential \(error.localizedDescription)")
                        completionBlock(.failure(error))
                        return
                    }
                    let email = authDataResult?.user.email
                    completionBlock(.success(.init(email: email ?? "not email")))
                }
            case .failure(let error):
                print("error login facebook \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
        }
   }
    
}

