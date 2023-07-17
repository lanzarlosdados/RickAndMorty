//
//  HomeMenuViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/06/2023.
//

import UIKit

final class HomeMenuViewController: UIViewController {
    
    lazy var presenter = HomeMenuItemPresenter(delegate: self)
    private var menuItems : [MenuItem] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
        Task {
            await presenter.getMenuItems()
        }
       
    }

    private func configCollection(){
        collectionView.configure(delegate: self, dataSource: self, cells: [CharactersCell.self])
    }

}

extension HomeMenuViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(cellType: CharactersCell.self , at: indexPath)
        cell.configCell(menuItem: self.menuItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2.2, height: 150.0)
    }
}

extension HomeMenuViewController : HomeMenuViewProtocol {
    func getData(menuItems: [MenuItem]) {
        self.menuItems = menuItems
        collectionView.reloadData()
        print("menu items",menuItems)
    }
}
