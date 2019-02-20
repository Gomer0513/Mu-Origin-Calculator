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
  
    // MARK: - Variables
    
    private var level: Int = 1
    private var rebirth: Int = 0
    private var fruits: Point = 0
    private var goldenSword: Point = 0
    private var goldenCrown: Point = 0
    private var goldenScripture: Point = 0
    private var goldenGrail: Point = 0
    
    private var relictSum: Point = 0
    
    // MARK: - Inits
    
    init (rebirth: Int?, level: Int?, fruits: Point?) {
        self.rebirth = rebirth ?? 0
        self.level = level ?? 1
        self.fruits = fruits ?? 0
    }
    
    required init () {}
    
    // MARK: - Methods
    
    func calculateStats() -> Point {
      var overalStats = 0

      for currentRebirth in 0...rebirth {
        if currentRebirth == rebirth {
          overalStats = overalStats + (level - 1)*(5+currentRebirth)
        } else {
          overalStats = overalStats + 99*(5 + currentRebirth)
        }
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
        
        relictSum = self.goldenSword + self.goldenCrown + self.goldenScripture + self.goldenGrail
    }
    
    func calculateFullStats() -> Point {
        return calculateStats() + fruits
    }
    
}
