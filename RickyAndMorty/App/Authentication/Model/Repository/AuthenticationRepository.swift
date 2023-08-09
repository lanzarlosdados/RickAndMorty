//
//  AuthenticationRepository.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation

final class AuthenticationRepository {
    
    private let authenticationFirebase = AuthenticationFirebase()
    
    func getCurrentUser() -> User? {
        authenticationFirebase.getCurrentUser()
    }
    
    func logOut() throws {
        try authenticationFirebase.logOut()
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        authenticationFirebase.createNewUser(email: email,
                                            password: password,
                                             completionBlock: completionBlock)
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        authenticationFirebase.login(email: email,
                                            password: password,
                                             completionBlock: completionBlock)
    }
    
    func loginWhitFacebook(completionBlock: @escaping (Result<User,Error>) -> Void) {
        authenticationFirebase.loginWhitFacebook(completionBlock: completionBlock)
    }
}
