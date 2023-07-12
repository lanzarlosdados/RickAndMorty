//
//  MenuRepository.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 11/07/2023.
//

import Foundation

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
