//
//  CharacterDetailViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var presenter = CharacterDetailPresenter(delegate: self)
    private var dataObject : [[Any]] = []
    private var dataSectionTitleList : [String] = []
    var characterId = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        Task{
            await presenter.getCharacterById(id:characterId)
        }
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

extension CharacterDetailViewController : CharacterDetailViewProtocol {
    
    func getData(list: [[Any]], sectionTitleList: [String]) {
        
        dataObject = list
        dataSectionTitleList = sectionTitleList
        print(list)
//        tableView.reloadData()

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
