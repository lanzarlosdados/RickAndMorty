//
//  TabBar.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/07/2023.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

           view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
    }
    
    func setupVCs() {
            viewControllers = [
                createNavController(for: CharactersViewController(), title: NSLocalizedString("Characters", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
                createNavController(for: LocationsViewController(), title: NSLocalizedString("Locations", comment: ""), image: UIImage(systemName: "house")!),
                createNavController(for: EpisodesViewController(), title: NSLocalizedString("Episodes", comment: ""), image: UIImage(systemName: "person")!)
            ]
        }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = rootViewController
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            return navController
        }


}
