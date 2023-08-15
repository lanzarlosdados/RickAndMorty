//
//  CardView.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 27/07/2023.
//

import UIKit

class CardView : UIView {
    
    var cornnerRadius : CGFloat = 8
    var shadowOfSetWidth : CGFloat = 0
    var shadowOfSetHeight : CGFloat = 2
    
    var shadowColour : UIColor = UIColor.lightGray
    var shadowOpacity : CGFloat = 0.7
    
    override func layoutSubviews() {
        layer.cornerRadius = cornnerRadius
        layer.shadowColor = shadowColour.cgColor
        layer.shadowOffset = CGSize(width: shadowOfSetWidth, height: shadowOfSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornnerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = Float(shadowOpacity)
        
    }
}
