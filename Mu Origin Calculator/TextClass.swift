//
//  TextClass.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/25/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class TextClass: UITextField {
    
    override func awakeFromNib() {
        textColor = UIColor.orange.withAlphaComponent(1.0)
        backgroundColor = UIColor.black.withAlphaComponent(0.1)
        font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
    }
}
