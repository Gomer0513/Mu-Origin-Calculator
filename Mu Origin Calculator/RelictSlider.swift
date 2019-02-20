//
//  RelictSlider.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 1/7/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import UIKit

class RelictSlider: UISlider {
    
    // MARK: Constant
    
    private let thumbImage: UIImage = UIImage(named: "SliderImage")!
    
    override func awakeFromNib() {
        maximumTrackTintColor = UIColor.orange
        minimumTrackTintColor = UIColor.white
        minimumValue = 0
        maximumValue = 100
        setThumbImage(thumbImage, for: .normal)
    }
}
