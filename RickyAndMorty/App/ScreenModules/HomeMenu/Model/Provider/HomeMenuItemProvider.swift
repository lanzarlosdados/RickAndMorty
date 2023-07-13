//
//  HomeMenuItemProvider.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/07/2023.
//

import Foundation

protocol HomeMenuItemProviderProtocol : AnyObject {
    func getMenuItems() async throws -> MenuItems
}


class HomeMenuItemProvider : HomeMenuItemProviderProtocol {
    
    func getMenuItems() async throws -> MenuItems {
        guard let model = Utils.parseJson(jsonName: "File", model: MenuItems.self) else{
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    
}
