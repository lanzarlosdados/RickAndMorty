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
        return FakeCoordinator(navigation: navigation)
    }
    
    
}


final class FakeCoordinator: Coordinator {
    var navigation: UINavigationController
    
    init (navigation : UINavigationController){
        self.navigation = navigation
    }
    
    func start() {
        
    }
    
    
}
