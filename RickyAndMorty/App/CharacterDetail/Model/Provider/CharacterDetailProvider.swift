//
//  CharacterDetailProvider.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 24/07/2023.
//

import Foundation

protocol CharacterDetailProviderProtocol : AnyObject {
    func getCharacterById(characterId : String) async throws -> Character
    func getEpisodesByIds(episodeIds : String) async throws -> [Episode]
}

final class CharacterDetailProvider : CharacterDetailProviderProtocol {
    
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
    
    func getEpisodesByIds(episodeIds: String) async throws -> [Episode] {
        
        let request = RequestModel(endpoint: .episode, id: episodeIds)
        
        do{
            let model = try await  ServiceLayer.callService(request, [Episode].self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    
}
