//
//  Wings.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/20/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import Foundation

typealias CondorFlame = Int

enum Wings: CondorFlame {
    case tier1 = 14
    case tier2 = 90
    case tier3 = 291
    case tier4 = 702
    case tier5 = 1478
    case tier6 = 2670
    case tier7 = 4660
    case tier8 = 7660
    case tier9 = 7540
    
    // MARK: - Variables
    
    var value: CondorFlame {
        return rawValue
    }
    var name: String {
        switch self {
        case .tier1:
            return "T1"
        case .tier2:
            return "T2"
        case .tier3:
            return "T3"
        case .tier4:
            return "T4"
        case .tier5:
            return "T5"
        case .tier6:
            return "T6"
        case .tier7:
            return "T7"
        case .tier8:
            return "T8"
        case .tier9:
            return "T9"
        }
    }
    
    // MARK: - Constants
    
    static let valuesArray = [Wing.t1, Wing.t2, Wing.t3, Wing.t4, Wing.t5, Wing.t6, Wing.t7, Wing.t8, Wing.t9]
    static let titlesArray = [Wings.tier1.name, Wings.tier2.name, Wings.tier3.name, Wings.tier4.name, Wings.tier5.name, Wings.tier6.name, Wings.tier7.name, Wings.tier8.name, Wings.tier9.name]
}

struct Wing {
    
    // MARK: - Variables
    
    static var t1: CondorFlame = Wings.tier1.value
    static var t2: CondorFlame = Wings.tier1.value + Wings.tier2.value
    static var t3: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value
    static var t4: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value + Wings.tier4.value
    static var t5: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value + Wings.tier4.value + Wings.tier5.value
    static var t6: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value + Wings.tier4.value + Wings.tier5.value + Wings.tier6.value
    static var t7: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value + Wings.tier4.value + Wings.tier5.value + Wings.tier6.value + Wings.tier7.value
    static var t8: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value + Wings.tier4.value + Wings.tier5.value + Wings.tier6.value + Wings.tier7.value + Wings.tier8.value
    static var t9: CondorFlame = Wings.tier1.value + Wings.tier2.value + Wings.tier3.value + Wings.tier4.value + Wings.tier5.value + Wings.tier6.value + Wings.tier7.value + Wings.tier8.value + Wings.tier9.value
    
    // MARK: - Methods
    
    func recalculatePoints(currentTitle: String, currentPoints: CondorFlame) -> Array<(key:String,value:CondorFlame)> {
        var showTitleValues: [String:CondorFlame] = [:]
        let startWith = Wings.titlesArray.firstIndex(of: currentTitle)!
        
        for index in startWith+1..<Wings.valuesArray.count {
            showTitleValues[Wings.titlesArray[index]] = Wings.valuesArray[index] - currentPoints - Wings.valuesArray[startWith]
        }
        
        let sortedTitle = showTitleValues.sorted(by: {$0.value < $1.value})
        return sortedTitle
    }
    
    func evaluatePointsForTitle(currentTitle: String) -> CondorFlame {
        let index = Wings.titlesArray.firstIndex(of: currentTitle)!
        if index != 0 {
            return Wings.valuesArray[index] - Wings.valuesArray[index-1]
        } else {
            return Wings.valuesArray[index]
        }
    }
}
