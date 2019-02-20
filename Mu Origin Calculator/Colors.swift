//
//  Colors.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/23/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
  
    convenience init(red: Int, green: Int, blue: Int) {
      self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

let backgroundColor = UIColor(rgb: 0x1C1C1C)
