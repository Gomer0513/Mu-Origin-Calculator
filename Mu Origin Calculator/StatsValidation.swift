//
//  StatsValidation.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 2/20/19.
//  Copyright © 2019 Oleksandr Kysil. All rights reserved.
//

import Foundation

struct StatsValidation {
    
    // MARK: - Constants
    
    private static let rebirthLimitation = "[0-9]{1}|10|11|12|13|14|15"
    private static let levelLimitation = "(?:(?!0)[0-9]{1,2}|100)"
    private static let fruitsLimitation = "[0-9]{1,6}"
    private static let diamondsLimitation = "[0-9]{1,9}"
    
    static func forRebirth(_ enteredData: String?) -> Bool {
        
        guard let enteredData = enteredData else { return false }
        
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", rebirthLimitation)
        return formatPredicate.evaluate(with: enteredData)
    }
    
    static func forLevels(_ enteredData: String?) -> Bool {
        
        guard let enteredData = enteredData else { return false }
        
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", levelLimitation)
        return formatPredicate.evaluate(with: enteredData)
    }
    
    static func forCreatons(_ enteredData: String?) -> Bool {
        
        guard let enteredData = enteredData else { return false }
        
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", fruitsLimitation)
        return formatPredicate.evaluate(with: enteredData)
    }
    
    static func forDiamonds(_ enteredData: String?) -> Bool {
        guard let enteredData = enteredData else { return false }
        
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", diamondsLimitation)
        return formatPredicate.evaluate(with: enteredData)
    }
}
