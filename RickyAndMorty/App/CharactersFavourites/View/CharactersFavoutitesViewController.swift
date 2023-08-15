//
//  CharactersFavoutitesViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/08/2023.
//

import UIKit

class CharactersFavoutitesViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView(){
        tableView.configure(delegate: self, dataSource: self, cells: [
            CharactersFavouritesCell.self])
    }

}
extension CharactersFavoutitesViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for:  CharactersFavouritesCell.self, for: indexPath)
        cell.configCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let vc = CharacterDetailViewController()
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
}
