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
           navigationItem.setHidesBackButton(true, animated: true)
           view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupVCs() {
            viewControllers = [
                createNavController(for: CharactersViewController(), title: NSLocalizedString("Characters", comment: ""), image: UIImage(systemName: "person.3")!),
                createNavController(for: LocationsViewController(), title: NSLocalizedString("Locations", comment: ""), image: UIImage(systemName: "location")!),
                createNavController(for: EpisodesViewController(), title: NSLocalizedString("Episodes", comment: ""), image: UIImage(systemName: "play.rectangle")!),
                createNavController(for: CharactersFavoutitesViewController(), title: NSLocalizedString("Favourites", comment: ""), image: UIImage(systemName: "heart")!),
                createNavController(for: ProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
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
