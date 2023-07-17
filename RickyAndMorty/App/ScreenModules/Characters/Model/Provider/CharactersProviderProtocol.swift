//
//  CharactersProviderProtocol.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

protocol CharactersProviderProtocol : AnyObject {
    func getAllCharacters() async throws -> Characters
}

class CharactersProvider : CharactersProviderProtocol {
    
    func getAllCharacters() async throws -> Characters {
        let request = RequestModel(endpoint: .character)
        
        do{
            let model = try await  ServiceLayer.callService(request, Characters.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    
    
}
