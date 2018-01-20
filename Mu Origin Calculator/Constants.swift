//
//  Constants.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/29/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import Foundation

let rebirthMinValue = "0"
let rebirthMaxValue = "11"

let levelMinValue = "1"
let levelMaxValue = "100"

enum InputStats: String {
    case rebirth
    case level
    case creaton
    case goldenSword
    case goldenCrown
    case goldenScripture
    case goldenGrail
    
    var key: String {
        get {
            return self.rawValue
        }
    }
}
