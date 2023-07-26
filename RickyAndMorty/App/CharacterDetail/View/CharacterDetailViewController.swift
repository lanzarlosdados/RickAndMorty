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
        print(sectionTitleList)
        tableView.reloadData()

    }
    
}

extension CharacterDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("section", "\(dataObject.count)")
        return dataObject.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section", "\(dataObject[section].count)")
        return dataObject[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataObject[indexPath.section]
        
        if let character = item as? [Character] {
            let characterCell = tableView.dequeueReusableCell(for: CharacterDetailTableViewCell.self, for: indexPath)
            
            return characterCell
            
        }else if let episode = item as? [Episode] {
            let episodeCell = tableView.dequeueReusableCell(for: EpisodesDescripcionTableViewCell.self, for: indexPath)
            episodeCell.configCell(episod: episode[indexPath.row])
            return episodeCell
        }
        
        return UITableViewCell()
    }
}
