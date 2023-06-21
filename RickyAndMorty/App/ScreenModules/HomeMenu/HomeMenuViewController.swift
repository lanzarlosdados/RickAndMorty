//
//  HomeMenuViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/06/2023.
//

import UIKit

class HomeMenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configCollection()
    }

    private func configCollection(){
        collectionView.configure(delegate: self, dataSource: self, cells: [CharactersCell.self])
    }

}

extension HomeMenuViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(cellType: CharactersCell.self , at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2.2, height: 150.0)
    }
}
