//
//  AppCoordinator.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/06/2023.
//
import UIKit

final class AppCoordinator : Coordinator {
    
    var navigation: UINavigationController
    private let appFactory : AppFactory
    
    init (navigation : UINavigationController, appFactory : AppFactory,window : UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    private func configWindow (window : UIWindow?){
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    func start() {
        let coordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        coordinator.start()
    }
    
    
}
