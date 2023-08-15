//
//  AuthenticationFirebase.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 03/08/2023.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import UIKit

final class AuthenticationFirebase{
    
    private let facebookAuth = FacebookAuthentication()
    private let googleAuth = GoogleAuthentication()
    private let storageRef = Storage.storage().reference()
    
    
    func uploadMedia(imageProfile: UIImage,completion: @escaping (_ url: String?) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = Date()
        dateFormatter.locale = Locale(identifier: "en_US")
        
        
        guard let userId = Auth.auth().currentUser?.uid else {return}
        let imageName = String("\(dateFormatter.string(from: date)).png")
        let storageRef = storageRef.child(userId).child(imageName)
        
        if let uploadData = imageProfile.pngData() {
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("error")
                    completion(nil)
                } else {
                    storageRef.downloadURL(completion: { (url, error) in
                        
                        print(url?.absoluteString as Any)
                        completion(url?.absoluteString)
                    })
                }
            }
        }
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
    
    func getCurrentUser() -> User? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        return .init(email: user.email ?? "not email",displayName: user.displayName,profileImageUrl: user.photoURL)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "not email"
            completionBlock(.success(.init(email: email,displayName: nil,profileImageUrl: nil)))
        }
    }

    
    func updateUserName(name: String, completionBlock: @escaping (Result<Bool,Error>) -> Void) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges { error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            completionBlock(.success(true))
        }

    }
    
    func updateUserPhotoUrl(photoUrl: String, completionBlock: @escaping (Result<Bool,Error>) -> Void) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.photoURL = URL(string: photoUrl)
        changeRequest?.commitChanges { error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            completionBlock(.success(true))
        }

    }
    func login(email: String, password: String, completionBlock: @escaping (Result<User,Error>) -> Void) {
       
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
           if let error = error {
               completionBlock(.failure(error))
               return
           }
           let email = authDataResult?.user.email ?? "not email"
           completionBlock(.success(.init(email: email,displayName: nil,profileImageUrl: nil)))
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
                    completionBlock(.success(.init(email: email ?? "not email",displayName: nil,profileImageUrl: nil)))
                }
            case .failure(let error):
                print("error login facebook \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
        }
   }
    
    func loginWhitGoogle(viewController: UIViewController,completionBlock: @escaping (Result<User,Error>) -> Void) {
        googleAuth.loginGoogle(viewController: viewController) { result in
            switch result {
            case .success(let user):
                if let idToken = user.idToken?.tokenString {
                    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                    
                    Auth.auth().signIn(with: credential) { authDataResult, error in
                        if let error = error {
                            print("error creating new user whit credential \(error.localizedDescription)")
                            completionBlock(.failure(error))
                            return
                        }
                        let email = authDataResult?.user.email
                        completionBlock(.success(.init(email: email ?? "not email",displayName: nil,profileImageUrl: nil)))
                    }
                }
            case .failure(let error):
                print("error login facebook \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
        }
    }
    
}

