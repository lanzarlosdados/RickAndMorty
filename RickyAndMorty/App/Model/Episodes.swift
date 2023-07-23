//
//  Episodes.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 23/07/2023.
//

struct Episodes : Codable {
    let info: Info
    let results: [Episode]
}
struct Episode : Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
