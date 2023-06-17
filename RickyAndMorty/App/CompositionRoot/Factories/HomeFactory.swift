//
//  HomeFactory.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/06/2023.
//

import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}


struct HomeFactoryImp : HomeFactory {
    
    func makeModule() -> UIViewController {
        return HomeMenuController()
    }
    
    
}
