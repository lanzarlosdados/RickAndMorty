//
//  CharactersFavouritesCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 15/08/2023.
//

import UIKit
import Kingfisher

class CharactersFavouritesCell: UITableViewCell {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(characterFavourite : CharacterFavourite){
        self.name.text = characterFavourite.name
        self.type.text = characterFavourite.type.capitalized
        let imageUrl = URL(string: characterFavourite.urlImage)
        imageCharacter.kf.setImage(with: imageUrl)
    }
}
