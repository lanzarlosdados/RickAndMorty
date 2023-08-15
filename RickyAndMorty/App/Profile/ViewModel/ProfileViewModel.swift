//
//  ProfileViewModel.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/08/2023.
//

import Foundation
import Combine
import UIKit

@MainActor
final class ProfileViewModel: ObservableObject {
    
    var delegate : BaseViewProtocol?
    private let profileRepository : ProfileRepository
    var postObservable = PassthroughSubject<Void,Error>()
    var user : User?
    
    init(profileRepository: ProfileRepository = ProfileRepository()) {
        self.profileRepository = profileRepository
        getCurrentUser()
    }
    
    func updateUser(name: String, imageProfile: UIImage){
        delegate?.loadingView(.show)
        
        profileRepository.updateName(name: name) { [weak self] result in
            switch result {
            case .success(let state):
                if state {
                    self?.profileRepository.uploadMedia(imageProfile: imageProfile, completion: { url in
                        guard let url = url else { return }
                        self?.updatePhotoUrl(url: url)
                    })
                }
            case .failure(let error):
                self?.delegate?.showError(error.localizedDescription, callback: nil)
            }
        }
    }
    
    private func updatePhotoUrl(url: String){
        profileRepository.updatePhotoUrl(url: url) { [weak self] result in
            switch result {
            case .success(let state):
                if state {
                    self?.delegate?.loadingView(.hide)
                    self?.getCurrentUser()
                }
                self?.delegate?.showMessage(.success, "El usuario se ha actualizado correctamente", callback: nil)
            case .failure(let error):
                self?.delegate?.showError(error.localizedDescription, callback: nil)
            }
        }

    }
    
    func getCurrentUser() {
        if let user = profileRepository.getCurrentUser() {
            self.user = user
            postObservable.send()
        }
    }
    
    func logout() {
        do {
           try profileRepository.logOut()
            print("user logout")
        }catch {
            print("error logout")
        }
       
    }
}
