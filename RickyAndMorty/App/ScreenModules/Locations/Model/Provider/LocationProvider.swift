//
//  LocationProvider.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 23/07/2023.
//

protocol LocationsProviderProtocol : AnyObject {
    func getLocations() async throws -> Locations
}

class LocationsProvider : LocationsProviderProtocol {
    
    func getLocations() async throws -> Locations {
        let request = RequestModel(endpoint: .location)
        
        do{
            let model = try await  ServiceLayer.callService(request, Locations.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    
    
}
