//
//  LocationsViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 18/07/2023.
//

import UIKit

class LocationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView(){
        tableView.configure(delegate: self, dataSource: self, cells: [
            LocationCell.self])
    }
}

extension LocationsViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for:  LocationCell.self, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let vc = CharacterDetailViewController()
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
}
