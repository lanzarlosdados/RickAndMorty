//
//  LocationCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/07/2023.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var type: UILabel!
    @IBOutlet weak private var dimension: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(location : Location){
        name.text = location.name
        type.text = location.type
        dimension.text = location.dimension
    }
 
}
