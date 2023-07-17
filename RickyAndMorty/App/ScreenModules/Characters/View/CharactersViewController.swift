//
//  CharactersViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/07/2023.
//

import UIKit

final class CharactersViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter = CharactersPresenter(delegate: self)
    private var characters : [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        Task {
            await presenter.getCharacters()
        }
    }

    private func configTableView(){
        tableView.configure(delegate: self, dataSource: self, cells: [CharacterTableViewCell.self])
    }
}

extension CharactersViewController: CharactersViewProtocol {
    func getData(list: [Result]) {
        characters = list
        tableView.reloadData()
        print("characters", list)
    }
    
    
}

extension CharactersViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: CharacterTableViewCell.self, for: indexPath)
        cell.configCell(character: characters[indexPath.row])
        return cell
    }
}
