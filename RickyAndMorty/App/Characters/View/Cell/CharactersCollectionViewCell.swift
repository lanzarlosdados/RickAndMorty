//
//  CharactersCollectionViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 27/07/2023.
//

import UIKit
import SwiftUI

class CharactersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    func configCell(character: Character) {
        let contentConfiguration = UIHostingConfiguration {
            CharactersView(character: character)
        }
        
        self.contentConfiguration = contentConfiguration
    }
}
