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
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 5
        self.backgroundColor = backgroundColor?.withAlphaComponent(0)
    }
    
}
