//
//  RequestModel.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/07/2023.
//

import Foundation

struct RequestModel  {
    let endpoint : Endpoints
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .rickAndMorty
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }

    enum Endpoints : String   {
        case character = "/character"
        case location = "/location"
        case episode = "/episode"
    }

    enum URLBase : String{
        case rickAndMorty = "https://rickandmortyapi.com/api"
        case google = "https://othereweb.com/v2"
    }
}
