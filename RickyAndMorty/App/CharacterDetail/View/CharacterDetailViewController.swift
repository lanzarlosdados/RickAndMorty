//
//  CharacterDetailViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var nameStatus: UILabel!
    
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
        tableView.registerFromClass(headerFooterView: SectionTitleView.self)

    }

}

extension CharacterDetailViewController : CharacterDetailViewProtocol {
    
    func getData(list: [[Any]], sectionTitleList: [String]) {
        dataObject = list
        dataSectionTitleList = sectionTitleList
        tableView.reloadData()
    }
    
}

extension CharacterDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataObject.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataObject[indexPath.section]
        
        if let character = item as? [Character] {
            let characterCell = tableView.dequeueReusableCell(for: CharacterDetailTableViewCell.self, for: indexPath)
            statusView.backgroundColor = character[indexPath.row].status == Status.alive ? UIColor.green : UIColor.red
            nameStatus.textColor = character[indexPath.row].status == Status.alive ? UIColor.green : UIColor.red
            nameCharacter.text = character[indexPath.row].name
            nameStatus.text = "( \(character[indexPath.row].status.rawValue) )"
            characterCell.configCell(character: character[indexPath.row])
            return characterCell
            
        }else if let episode = item as? [Episode] {
            let episodeCell = tableView.dequeueReusableCell(for: EpisodesDescripcionTableViewCell.self, for: indexPath)
            episodeCell.configCell(episod: episode[indexPath.row])
            return episodeCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionTitleView.self)") as? SectionTitleView else{
            return nil
        }
        sectionView.title.text = dataSectionTitleList[section]
        sectionView.configView()
        return sectionView
    }
}
