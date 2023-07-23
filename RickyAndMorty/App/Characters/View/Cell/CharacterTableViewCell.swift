//
//  CharacterTableViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/07/2023.
//
import Kingfisher
import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterStatusAndLocation: UILabel!
    @IBOutlet weak var lastKnowLocation: UILabel!
    @IBOutlet weak var firstSeenIn: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    func configCell(character : Result) {
        characterName.text = character.name
        characterStatusAndLocation.text = " \(character.status.rawValue) - \(character.species.rawValue) "
        lastKnowLocation.text = character.location.name
        firstSeenIn.text = character.origin.name
        statusView.backgroundColor = (character.status == Status.alive) ? UIColor.green : UIColor.red
        
        let imageUrl = URL(string: character.image)
        imageCharacter.kf.setImage(with: imageUrl)
    }
    
}