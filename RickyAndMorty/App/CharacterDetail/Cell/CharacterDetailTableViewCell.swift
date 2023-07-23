//
//  CharacterDetailTableViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit
import Kingfisher

class CharacterDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var stausName: UILabel!
    @IBOutlet weak var specieAndGender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(character : Result){
        statusView.backgroundColor = character.status == Status.alive ? UIColor.green : UIColor.red
        characterName.text = character.name
        stausName.text = "( \(character.status.rawValue) )"
        specieAndGender.text = "\(character.species.rawValue) - \(character.gender.rawValue)"
        
        let url = URL(string: character.image)
        
        imageCharacter.kf.setImage(with: url)
        
        
    }
    
}
