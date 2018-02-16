//
//  RelictSlider.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 1/7/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import UIKit

class RelictSlider: UISlider {
    
    let thumbImage: UIImage = UIImage(named: "SliderImage")!
    
    override func awakeFromNib() {
        self.maximumTrackTintColor = UIColor.orange
        self.minimumTrackTintColor = UIColor.white
        self.minimumValue = 0
        self.maximumValue = 100
        self.setThumbImage(thumbImage, for: .normal)
    }
}
