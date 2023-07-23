//
//  EpisodeProvider.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 23/07/2023.
//

protocol EpisodesProviderProtocol : AnyObject {
    func getEpisodes() async throws -> Episodes
}

class EpisodesProvider : EpisodesProviderProtocol {
    
    func getEpisodes() async throws -> Episodes {
        let request = RequestModel(endpoint: .episode)
        
        do{
            let model = try await  ServiceLayer.callService(request, Episodes.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    
    
}
