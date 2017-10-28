//
//  ChangeStatsButton.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/29/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class ChangeStatsButton: UIButton {

    override func awakeFromNib() {
        self.setTitle("+", for: .normal)
        self.setTitleColor(UIColor.orange.withAlphaComponent(0.75), for: .normal)
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 25.0)
    }
}
