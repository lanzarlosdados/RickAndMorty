//
//  CharactersCollectionViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 27/07/2023.
//

import UIKit
import Kingfisher

class CharactersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCharacter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageCharacter.layer.cornerRadius = 8
    }
    
    func configCell(character : Character) {
        characterName.text = character.name
        statusView.backgroundColor = (character.status == Status.alive) ? UIColor.green : UIColor.red
        let imageUrl = URL(string: character.image)
        imageCharacter.kf.setImage(with: imageUrl)
    }
}
