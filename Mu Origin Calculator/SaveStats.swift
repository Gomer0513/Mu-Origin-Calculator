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
    
    // MARK: - Setters
    
    func saveData(_ data: String?, key: String) {
        defaults.set(data, forKey: typeOfClass+key)
    }
    func saveData(_ data: Int, key: String) {
        defaults.set(data, forKey: typeOfClass+key)
    }
    func saveData(_ data: Float, key: String) {
        defaults.set(data, forKey: typeOfClass+key)
    }
    
    // MARK: - Getters
    
    func getData(key: String) -> String? {
        if let data = defaults.string(forKey: typeOfClass+key) {
            return data
        } else {
            return nil
        }
    }
    
    func getData(key: String) -> Int {
        let data = defaults.integer(forKey: typeOfClass+key)
        if data != 0 {
            return data
        } else {
            return 0
        }
    }
    
    func getData(key: String) -> Float {
        let data = defaults.float(forKey: typeOfClass+key)
        if data != 0 {
            return data
        } else {
            return 0
        }
    }
}
