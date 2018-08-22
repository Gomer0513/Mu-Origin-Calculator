//
//  Constants.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 10/29/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import Foundation

let rebirthMinValue = "0"
let rebirthMaxValue = "14"

let levelMinValue = "1"
let levelMaxValue = "100"

let productID = "Oleksandr_Kysil.Mu_Origin_Calculator.Extra_Stats"

typealias Diamond = Int

enum InputStats: String {
    case rebirth
    case level
    case creaton
    case goldenSword
    case goldenCrown
    case goldenScripture
    case goldenGrail
    case diamondsPerDay
    case achievementTitle
    case fameTitle
    case wingsTitle
    case currentAchievemntPoints
    case currentFamePoints
    case currentWingsPoints
    case achievementPercentage
    case famePercentage
    case wingsPercentage
    
    var key: String {
        get {
            return self.rawValue
        }
    }
}

extension Float {
    func roundToInt() -> Int {
        let value = Int(self)
        let f = self - Float(value)
        if f >= 0.1 {
            return value + 1
        } else {
            return value + 1
        }
    }
}
