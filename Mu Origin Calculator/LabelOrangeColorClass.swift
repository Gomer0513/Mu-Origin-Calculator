//
//  LabelOrangeColorClass.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/26/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class LabelOrangeColorClass: UILabel {

    override func awakeFromNib() {
        self.textColor = .orange
        self.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)
    }
}
