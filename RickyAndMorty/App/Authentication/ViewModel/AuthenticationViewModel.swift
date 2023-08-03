//
//  AuthenticationViewModel.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation
protocol UserViewProtocol : AnyObject, BaseViewProtocol {
    func getUser(user : User)
    func getErrorMessage(error: String)
}

final class AuthenticationViewModel {
    
    weak var delegate : UserViewProtocol?
    private let authRepository : AuthenticationRepository
    
    init(authRepository: AuthenticationRepository = AuthenticationRepository(), delegate: UserViewProtocol) {
        self.authRepository = authRepository
        self.delegate = delegate
    }
    
    func createNewUser(email: String, password: String){
        delegate?.loadingView(.show)
        
        defer{
            delegate?.loadingView(.hide)
        }
        
        authRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.getUser(user: user)
            case .failure(let error):
                self?.delegate?.getErrorMessage(error: error.localizedDescription)
            }
        }
        
    }
}

