//
//  SaveStats.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 11/12/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import Foundation

class SaveStats {
    
    // MARK: - Variables
    private var typeOfClass = String()
    private var defaults = UserDefaults()
    
    init(character: Classes.RawValue) {
        typeOfClass = character
    }
    
    func saveData(_ data: String?, key: String) {
        defaults.set(data, forKey: typeOfClass+key)
        defaults.synchronize()
    }
    
    func getData(key: String) -> String? {
        if let data = defaults.string(forKey: typeOfClass+key) {
            return data
        } else {
            return nil
        }
    }
}
