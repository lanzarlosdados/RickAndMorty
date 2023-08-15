//
//  Repository.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/08/2023.
//

import Foundation
import UIKit

final class ProfileRepository {
    private let authenticationFirebase = AuthenticationFirebase()
    
    func updateName(name: String, completionBlock: @escaping (Result<Bool,Error>) -> Void) {
        authenticationFirebase.updateUserName(name: name, completionBlock: completionBlock)
    }
    
    func uploadMedia(imageProfile: UIImage,completion: @escaping (_ url: String?) -> Void) {
        authenticationFirebase.uploadMedia(imageProfile: imageProfile, completion: completion)
    }

    
    func updatePhotoUrl(url: String, completionBlock: @escaping (Result<Bool,Error>) -> Void){
        authenticationFirebase.updateUserPhotoUrl(photoUrl: url, completionBlock: completionBlock)
    }
    func getCurrentUser() -> User? {
        authenticationFirebase.getCurrentUser()
    }
    
    func logOut() throws {
        try authenticationFirebase.logOut()
    }
}
