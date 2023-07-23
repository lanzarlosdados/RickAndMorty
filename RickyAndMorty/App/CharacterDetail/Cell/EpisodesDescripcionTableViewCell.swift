//
//  EpisodesDescripcionTableViewCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/07/2023.
//

import UIKit

class EpisodesDescripcionTableViewCell: UITableViewCell {

    @IBOutlet weak private var episode: UILabel!
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var airDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(episod : Episode){
        episode.text = episod.episode
        name.text = episod.name
        airDate.text = episod.airDate
    }
    
}
