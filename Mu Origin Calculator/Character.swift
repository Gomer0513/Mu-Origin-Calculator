//
//  Character.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/13/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import Foundation

typealias Point = Int

enum Stats: Point {
    case str
    case eng
    case agi
    case sta
}

enum Classes: String {
    case dk = "Dark Knight"
    case dw = "Dark Wizard"
    case elf = "Elf"
    case mg = "Magic Knight"
}

class Character {
    var level: Int = 1
    var rebirth: Int = 0
    var stats: Stats?
    var fruits: Point = 0
    
    init (rebirth: Int?, level: Int?, fruits: Point?) {
        self.rebirth = rebirth ?? 0
        self.level = level ?? 1
        self.fruits = fruits ?? 0
    }
    
    required init () {}
    
    func calculateStats() -> Point {
        var overalStats = 0
        var i = 0
        
        while i <= self.rebirth {
            switch i {
            case 0:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*5
                } else {
                    overalStats = overalStats + 495
                }
            case 1:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*6
                } else {
                    overalStats = overalStats + 99*6
                }
            case 2:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*7
                } else {
                    overalStats = overalStats + 99*7
                }
            case 3:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*8
                } else {
                    overalStats = overalStats + 99*8
                }
            case 4:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*9
                } else {
                    overalStats = overalStats + 99*9
                }
            case 5:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*10
                } else {
                    overalStats = overalStats + 99*10
                }
            case 6:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*11
                } else {
                    overalStats = overalStats + 99*11
                }
            case 7:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*12
                } else {
                    overalStats = overalStats + 99*12
                }
            case 8:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*13
                } else {
                    overalStats = overalStats + 99*13
                }
            case 9:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*14
                } else {
                    overalStats = overalStats + 99*14
                }
            case 10:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*15
                } else {
                    overalStats = overalStats + 99*15
                }
            default:
                print("unknown rebirth")
            }
            i = i + 1
        }
        
        return overalStats
    }
    
    func calculateFullStats() -> Point {
        let sum: Point = self.calculateStats() + self.fruits
        return sum
    }
    
}
