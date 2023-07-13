//
//  CharactersCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/06/2023.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
    let CORNER_RADIUS = 8
    
    @IBOutlet weak var tilteImage: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageCell.layer.cornerRadius = CGFloat(CORNER_RADIUS)
        tilteImage.layer.cornerRadius = CGFloat(CORNER_RADIUS)
        tilteImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func configCell(menuItem : MenuItem) {
        tilteImage.text = menuItem.title
        imageCell.image = UIImage(named: menuItem.imageName)
    }
}
