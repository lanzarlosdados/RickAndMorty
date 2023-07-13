//
//  MenuItem.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/07/2023.
//

import Foundation


struct MenuItems : Decodable {
    let menuItems : [MenuItem]
    
}

struct MenuItem : Codable {
    let title, imageName : String
}
