//
//  MenuButton.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/24/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class MenuButton: UIButton {

    override func awakeFromNib() {
        setTitleColor(.white, for: .normal)
        setTitleColor(.orange, for: .disabled)
        setTitleColor(.gray, for: .selected)
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30.0)
    }
}
