//
//  LocationsViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 18/07/2023.
//

import UIKit

final class LocationsViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter = LocationsPresenter(delegate: self)
    private var locations : [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        Task {
            await presenter.getLocations()
        }
    }
    
    private func configTableView(){
        tableView.configure(delegate: self, dataSource: self, cells: [
            LocationCell.self])
    }
}

extension LocationsViewController: LocationsViewProtocol {
    func getData(list: [Location]) {
        locations = list
        tableView.reloadData()
        print("characters", list)
    }
}

extension LocationsViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for:  LocationCell.self, for: indexPath)
        cell.configCell(location: locations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let vc = CharacterDetailViewController()
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
}
