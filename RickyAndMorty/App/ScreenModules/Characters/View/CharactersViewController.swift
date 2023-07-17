//
//  CharactersViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/07/2023.
//

import UIKit

final class CharactersViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView(){
        tableView.configure(delegate: self, dataSource: self, cells: [CharacterTableViewCell.self])
    }
}

extension CharactersViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: CharacterTableViewCell.self, for: indexPath)
        return cell
    }
}
