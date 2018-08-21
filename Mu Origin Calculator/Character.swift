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
    case sum = "Summoner"
    case extra = "Extra Stats"
}

class Character {
    var level: Int = 1
    var rebirth: Int = 0
    var fruits: Point = 0
    var goldenSword: Point = 0
    var goldenCrown: Point = 0
    var goldenScripture: Point = 0
    var goldenGrail: Point = 0
    
    private var relictSum: Point = 0
    
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
            case 11:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*16
                } else {
                    overalStats = overalStats + 99*16
                }
            case 12:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*17
                } else {
                    overalStats = overalStats + 99*17
                }
            case 13:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*18
                } else {
                    overalStats = overalStats + 99*18
                }
            case 14:
                if i == self.rebirth {
                    overalStats = overalStats + (self.level - 1)*19
                } else {
                    overalStats = overalStats + 99*19
                }
            default:
                print("unknown rebirth")
            }
            i = i + 1
        }
        
        return overalStats
    }
    
    func evaluateRelicts(goldenSword: Point? = nil ?? 0, goldenCrown: Point? = nil ?? 0, goldenScripture: Point? = nil ?? 0, goldenGrail: Point? = nil ?? 0) {
        if goldenSword != nil {
            self.goldenSword = goldenSword!
        }
        if goldenCrown != nil {
            self.goldenCrown = goldenCrown!
        }
        if goldenScripture != nil {
            self.goldenScripture = goldenScripture!
        }
        if goldenGrail != nil {
            self.goldenGrail = goldenGrail!
        }
        
        self.relictSum = self.goldenSword + self.goldenCrown + self.goldenScripture + self.goldenGrail
    }
    
    func calculateFullStats() -> Point {
        return self.calculateStats() + self.fruits
    }
    
}
