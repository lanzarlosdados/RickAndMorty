//
//  CharacterDetailTableViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit
import Kingfisher

class CharacterDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lastLocation: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCharacter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageCharacter.layer.cornerRadius = 8
    }
    
    func configCell(character : Character){
        lastLocation.text = character.location.name
        origin.text = character.origin.name
        gender.text = character.gender.rawValue
        specie.text = character.species.rawValue
        let url = URL(string: character.image)
        imageCharacter.kf.setImage(with: url)
    }
    
}
