//
//  CharactersFavoutitesViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/08/2023.
//

import UIKit
import Combine

final class CharactersFavoutitesViewController: BaseViewController, BaseViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    var charactersFavourite : [CharacterFavourite] = []
    var viewModel = CharactersFavouriteViewModel()
    private var anyCancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configTableView()
        subscriptions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getCharactersFavourite()
    }
    
    private func configTableView(){
        tableView.configure(delegate: self, dataSource: self, cells: [
            CharactersFavouritesCell.self])
    }
    
    private func subscriptions(){
           viewModel.postObservable.sink { error in
               print("error: ", error)
           } receiveValue: {[weak self] in
               self?.charactersFavourite = self?.viewModel.charactersFavourite ?? []
               self?.tableView.reloadData()
           }.store(in: &anyCancellable)
       }

}
extension CharactersFavoutitesViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersFavourite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for:  CharactersFavouritesCell.self, for: indexPath)
        print(charactersFavourite[indexPath.row] as Any)
        cell.configCell(characterFavourite: charactersFavourite[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let vc = CharacterDetailViewController()
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
}
