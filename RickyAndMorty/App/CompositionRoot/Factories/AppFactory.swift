//
//  AppFactorie.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/06/2023.
//

import UIKit

protocol AppFactory {
    func makeHomeCoordinator(navigation : UINavigationController) -> Coordinator
}

struct AppFactoryImp : AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImp()
        return HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
    }
}

