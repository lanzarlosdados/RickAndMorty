//
//  CharactersFavouriteRepository.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/08/2023.
//

import Foundation

final class CharactersFavouriteRepository {
    private let firestoreDatabase = FirestoreDatabase()
    
    func getCharactersFavourite(completion: @escaping (Result<[CharacterFavourite],Error>) -> Void){
        firestoreDatabase.getCharactersFavourite(completion: completion)
    }
}
