//
//  AuthenticationRepository.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation

final class AuthenticationRepository {
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        AuthenticationFirebase.createNewUser(email: email,
                                            password: password,
                                             completionBlock: completionBlock)
    }
}
