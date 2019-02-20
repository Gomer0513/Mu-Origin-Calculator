//
//  ShowItemsView.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 3/3/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import UIKit
import Foundation

class ShowItemsView: UIView {

    override func awakeFromNib() {
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 5
        backgroundColor = backgroundColor?.withAlphaComponent(0)
    }
    
}
