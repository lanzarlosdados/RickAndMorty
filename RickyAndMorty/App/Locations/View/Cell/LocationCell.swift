//
//  LocationCell.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 20/07/2023.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var dimension: UILabel!
    @IBOutlet weak var residents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(location : Location){
        name.text = location.name
        type.text = location.type
        dimension.text = location.dimension
        residents.text = "\(location.residents?.count ?? 0)"
    }
 
}
