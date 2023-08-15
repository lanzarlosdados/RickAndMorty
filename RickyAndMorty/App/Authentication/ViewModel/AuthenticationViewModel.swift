//
//  AuthenticationViewModel.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation
import UIKit

protocol UserViewProtocol : AnyObject, BaseViewProtocol {
    func getUser(user : User)
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
        
        authRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.getUser(user: user)
                self?.delegate?.loadingView(.hide)
            case .failure(let error):
                self?.delegate?.showError(error.localizedDescription, callback: nil)
            }
        }
    }
    
    func login(email: String, password: String){
        delegate?.loadingView(.show)
           
        authRepository.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.getUser(user: user)
                self?.delegate?.loadingView(.hide)
            case .failure(let error):
                self?.delegate?.showError(error.localizedDescription, callback: nil)
            }
        }
    }
    
    func loginWhitFacebook(){
        delegate?.loadingView(.show)

        authRepository.loginWhitFacebook() { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.getUser(user: user)
                self?.delegate?.loadingView(.hide)
            case .failure(let error):
                print(error.localizedDescription)
                self?.delegate?.showError("!Lo sentimos hubo un error, vuelve a intentar por favor!", callback: nil)
            }
        }
    }
    
    func loginWhitGoogle(viewController: UIViewController){
        delegate?.loadingView(.show)
        
        authRepository.loginWhitGoogle(viewController: viewController) { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.getUser(user: user)
                self?.delegate?.loadingView(.hide)
            case .failure(let error):
                print(error.localizedDescription)
                self?.delegate?.showError("!Lo sentimos hubo un error, vuelve a intentar por favor!", callback: nil)
            }
        }
    }
    
    func getCurrentUser() {
        if let user = authRepository.getCurrentUser() {
            self.delegate?.getUser(user: user)
        }
    }
    
    func logout() {
        do {
           try authRepository.logOut()
            print("user logout")
        }catch {
            print("error logout")
        }
       
    }
}

