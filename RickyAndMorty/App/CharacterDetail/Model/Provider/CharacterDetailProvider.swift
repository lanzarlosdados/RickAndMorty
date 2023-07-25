//
//  CharacterDetailProvider.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 24/07/2023.
//

import Foundation

protocol CharacterDetailProviderProtocol : AnyObject {
    func getCharacterById(characterId : String) async throws -> Character
//    func getEpisodesByIds(episodeId : [Int]) async throws -> Episode
}


class CharacterDetailProvider : CharacterDetailProviderProtocol {
    
    func getCharacterById(characterId: String) async throws -> Character {
        
        let request = RequestModel(endpoint: .character, id: characterId)
        
        do{
            let model = try await  ServiceLayer.callService(request, Character.self)
            return model
        }catch {
            print(error)
            throw error
        }

    }
//    
//    func getEpisodesByIds(episodeId: [Int]) async throws -> Episode {
//        <#code#>
//    }
    
}
