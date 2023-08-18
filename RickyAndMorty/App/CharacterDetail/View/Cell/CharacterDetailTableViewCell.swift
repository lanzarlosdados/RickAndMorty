//
//  CharacterDetailTableViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit
import Kingfisher

class CharacterDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var lastLocation: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    var touch = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCharacter.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageCharacter.layer.cornerRadius = 8
        isFavorite(self.heartButton)
    }
    
    @IBAction func heartButtonAction(_ button: UIButton) {
       isFavorite(button)
    }
    
    private func isFavorite(_ button: UIButton){
        touch = !touch
        UIView.animate(withDuration: 0.3) {
            if(self.touch){
                button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }else{
                button.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            self.layoutIfNeeded()
        }
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
