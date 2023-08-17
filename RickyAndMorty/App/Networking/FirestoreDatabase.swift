//
//  FirestoreDatabase.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 16/08/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CharacterFavourite: Decodable , Identifiable {
    @DocumentID var id: String?
    let name : String
    let type : String
    let urlImage: String
}

final class FirestoreDatabase {
    private let dataBase = Firestore.firestore()
    private let collection = "CharactersFavourite"
    
    func getCharactersFavourite(completion: @escaping (Result<[CharacterFavourite],Error>) -> Void){
        dataBase.collection(collection)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                guard let documents = querySnapshot?.documents.compactMap({ $0 }) else {
                    completion(.success([]))
                    return
                }
                let charactersFavourite = documents.map { try? $0.data(as: CharacterFavourite.self) }
                    .compactMap { $0 }
                print("charactersFavourite", charactersFavourite)
                completion(.success(charactersFavourite))
            }
    }
    
}
