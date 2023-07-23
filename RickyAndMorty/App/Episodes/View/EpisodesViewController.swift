//
//  EpisodesViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 18/07/2023.
//

import UIKit

final class EpisodesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter = EpisodesPresenter(delegate: self)
    private var episodes : [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        Task {
            await presenter.getEpisodes()
        }
    }
    
    func configTableView(){
        tableView.configure(delegate: self,
                            dataSource: self,
                            cells: [
                                EpisodesDescripcionTableViewCell.self
                            ])
    }
}

extension EpisodesViewController: EpisodesViewProtocol {
    func getData(list: [Episode]) {
        episodes = list
        tableView.reloadData()
        print("episode", list)
    }
}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(for: EpisodesDescripcionTableViewCell.self, for: indexPath)
            cell.configCell(episod: episodes[indexPath.row])
            return cell
    }
}
