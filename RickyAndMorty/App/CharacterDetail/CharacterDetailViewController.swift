//
//  CharacterDetailViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView(){
        tableView.configure(delegate: self,
                            dataSource: self,
                            cells: [
                                CharacterDetailTableViewCell.self,
                                EpisodesDescripcionTableViewCell.self
                            ])
    }

}

extension CharacterDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: CharacterDetailTableViewCell.self, for: indexPath)
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(for: EpisodesDescripcionTableViewCell.self, for: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    
}
