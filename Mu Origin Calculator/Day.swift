//
//  Day.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/20/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import Foundation

enum Types {
    case AchievementBadge, FameBadge, CondorFlame
}

class Day {
    private var diamonds: Diamond
    private var points = Int()
    private var type: Types
    
    init(type: Types, points: Int?, diamondsPerDay: Diamond) {
        self.points = points ?? 0
        diamonds = diamondsPerDay
        self.type = type
    }
    
    private func diamondsEvaluate() -> Diamond {
        switch type {
        case .AchievementBadge:
            return 90*points/3000
        case .FameBadge:
            return 90*points/6000
        case .CondorFlame:
            return 30*points
        }
    }
    
    func evaluateDays(percentage: Float) -> Int {
        var total: Float = 0.0
        let diamondsWithPercent = Float(diamonds)*(percentage/100)
        if diamondsWithPercent == 0 {
            total = Float(diamondsEvaluate())
        } else {
            total = Float(diamondsEvaluate())/diamondsWithPercent
        }
        return total.roundToInt()
    }
}
