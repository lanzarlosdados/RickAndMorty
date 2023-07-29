//
//  CharactersViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/07/2023.
//

import UIKit

final class CharactersViewController: BaseViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var presenter = CharactersPresenter(delegate: self)
    private var characters : [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configcollectionView()
        Task {
            await presenter.getCharacters()
        }
    }

    private func configcollectionView(){
        collectionView.configure(delegate: self, dataSource: self, cells: [CharactersCollectionViewCell.self])
    }
}

extension CharactersViewController: CharactersViewProtocol {
    func getData(list: [Character]) {
        characters = list
        collectionView.reloadData()
        print("characters", list)
    }
}

extension CharactersViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellType: CharactersCollectionViewCell.self, at: indexPath)
        cell.configCell(character: characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterDetailViewController()
        vc.characterId = String(characters[indexPath.row].id)
        print(vc.characterId)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.1 ,height: 220.0)
        }
}
