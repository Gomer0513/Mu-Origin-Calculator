//
//  LabelClass.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/25/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class LabelWhiteColorClass: UILabel {
    
    override func awakeFromNib() {
        self.textColor = .white
        self.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)
    }
}
