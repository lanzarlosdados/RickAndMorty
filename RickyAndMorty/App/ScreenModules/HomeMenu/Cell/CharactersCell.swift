//
//  CharactersCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/06/2023.
//

import UIKit

class CharactersCell: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.layer.cornerRadius = 8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .blue
    }

}
