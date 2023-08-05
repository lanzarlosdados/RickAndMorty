//
//  AuthenticationRepository.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation

final class AuthenticationRepository {
    
    func getCurrentUser() -> User? {
        AuthenticationFirebase.getCurrentUser()
    }
    
    func logOut() throws {
        try AuthenticationFirebase.logOut()
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        AuthenticationFirebase.createNewUser(email: email,
                                            password: password,
                                             completionBlock: completionBlock)
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        AuthenticationFirebase.login(email: email,
                                            password: password,
                                             completionBlock: completionBlock)
    }
}
