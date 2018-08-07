//
//  WeaponTests.swift
//  Mu Origin Calculator Tests
//
//  Created by Oleksandr Kysil on 8/7/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import XCTest

@testable import Mu_Origin_Calculator

class WeaponTests: XCTestCase {
    
    var darkKnightWeapon: Weapon!
    var darkWizardWeapon: Weapon!
    var elfWeapon: Weapon!
    var magicKnightWeapon: Weapon!
    var summonerWeapon: Weapon!
    
    override func setUp() {
        super.setUp()
        
        darkKnightWeapon = Weapon(belongsTo: .dk)
        darkWizardWeapon = Weapon(belongsTo: .dw)
        elfWeapon = Weapon(belongsTo: .elf)
        magicKnightWeapon = Weapon(belongsTo: .mg)
        summonerWeapon = Weapon(belongsTo: .sum)
    }
    
    override func tearDown() {
        super.tearDown()
        darkKnightWeapon = nil
        darkWizardWeapon = nil
        elfWeapon = nil
        magicKnightWeapon = nil
        summonerWeapon = nil
    }
    
    func testDarkKnightWeapon() {
        
        // T0
        XCTAssertEqual(darkKnightWeapon.getItem(str: 0, agi: 0).tier, nil, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 0, agi: 1000).tier, nil, "is correct")
        
        // T2
        XCTAssertEqual(darkKnightWeapon.getItem(str: 100, agi: 100).tier, 2, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 1000, agi: 100).tier, 2, "is correct")
        
        // T3
        XCTAssertEqual(darkKnightWeapon.getItem(str: 350, agi: 130).tier, 3, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 1000, agi: 130).tier, 3, "is correct")
        
        // T4
        XCTAssertEqual(darkKnightWeapon.getItem(str: 700, agi: 300).tier, 4, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 1200, agi: 300).tier, 4, "is correct")
        
        // T5
        XCTAssertEqual(darkKnightWeapon.getItem(str: 1300, agi: 500).tier, 5, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 2000, agi: 500).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(darkKnightWeapon.getItem(str: 2000, agi: 800).tier, 6, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 800).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(darkKnightWeapon.getItem(str: 3000, agi: 1300).tier, 7, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 1300).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(darkKnightWeapon.getItem(str: 4000, agi: 1600).tier, 8, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 1600).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(darkKnightWeapon.getItem(str: 5000, agi: 2000).tier, 9, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 2000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(darkKnightWeapon.getItem(str: 6000, agi: 2500).tier, 10, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 2500).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(darkKnightWeapon.getItem(str: 7000, agi: 3000).tier, 11, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 3000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(darkKnightWeapon.getItem(str: 8000, agi: 3200).tier, 12, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 3200).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(darkKnightWeapon.getItem(str: 9200, agi: 3700).tier, 13, "is correct")
        XCTAssertEqual(darkKnightWeapon.getItem(str: 10000, agi: 10000).tier, 13, "is correct")
    }
    
    func testDarkWizardWeapon() {
        
        // T0
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 0, eng: 0).tier, nil, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 0, eng: 1).tier, nil, "is correct")
        
        // T2
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 100, eng: 100).tier, 2, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 100, eng: 1000).tier, 2, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 0, eng: 1000).tier, 2, "is correct")
        
        // T3
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 130, eng: 350).tier, 3, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 130, eng: 1000).tier, 3, "is correct")
        
        // T4
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 300, eng: 700).tier, 4, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 300, eng: 1200).tier, 4, "is correct")
        
        // T5
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 500, eng: 1300).tier, 5, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 500, eng: 2000).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 800, eng: 2000).tier, 6, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 800, eng: 10000).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 1300, eng: 3000).tier, 7, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 1300, eng: 10000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 1600, eng: 4000).tier, 8, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 1600, eng: 10000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 2000, eng: 5000).tier, 9, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 2000, eng: 10000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 2500, eng: 6000).tier, 10, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 2500, eng: 10000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 3000, eng: 7000).tier, 11, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 3000, eng: 10000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 3200, eng: 8000).tier, 12, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 3200, eng: 10000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 3700, eng: 9200).tier, 13, "is correct")
        XCTAssertEqual(darkWizardWeapon.getItem(agi: 10000, eng: 10000).tier, 13, "is correct")
    }
    
    func testElfWeapon() {
        
        // T1
        XCTAssertEqual(elfWeapon.getItem(str: 0, agi: 0).tier, 1, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 0, agi: 1000).tier, 1, "is correct")
        
        // T2
        XCTAssertEqual(elfWeapon.getItem(str: 2, agi: 100).tier, 2, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 1000, agi: 100).tier, 2, "is correct")
        
        // T3
        XCTAssertEqual(elfWeapon.getItem(str: 350, agi: 130).tier, 3, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 1000, agi: 130).tier, 3, "is correct")
        
        // T4
        XCTAssertEqual(elfWeapon.getItem(str: 700, agi: 300).tier, 4, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 1200, agi: 300).tier, 4, "is correct")
        
        // T5
        XCTAssertEqual(elfWeapon.getItem(str: 1300, agi: 500).tier, 5, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 2000, agi: 500).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(elfWeapon.getItem(str: 2000, agi: 800).tier, 6, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 800).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(elfWeapon.getItem(str: 3000, agi: 1300).tier, 7, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 1300).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(elfWeapon.getItem(str: 4000, agi: 1600).tier, 8, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 1600).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(elfWeapon.getItem(str: 5000, agi: 2000).tier, 9, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 2000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(elfWeapon.getItem(str: 6000, agi: 2500).tier, 10, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 2500).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(elfWeapon.getItem(str: 7000, agi: 3000).tier, 11, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 3000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(elfWeapon.getItem(str: 8000, agi: 3200).tier, 12, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 3200).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(elfWeapon.getItem(str: 9200, agi: 3700).tier, 13, "is correct")
        XCTAssertEqual(elfWeapon.getItem(str: 10000, agi: 10000).tier, 13, "is correct")
    }
    
    func testMagicKnightWeapon() {
        
        // T0
        XCTAssertEqual(magicKnightWeapon.getItem(str: 200, agi: 100, eng: 200).tier, nil, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 200, agi: 300, eng: 200).tier, nil, "is correct")
        
        // T5
        XCTAssertEqual(magicKnightWeapon.getItem(str: 600, agi: 300, eng: 600).tier, 5, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 600, agi: 1000, eng: 600).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(magicKnightWeapon.getItem(str: 1800, agi: 800, eng: 1800).tier, 6, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 1800, agi: 10000, eng: 1800).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(magicKnightWeapon.getItem(str: 3000, agi: 1500, eng: 3000).tier, 7, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 3000, agi: 10000, eng: 3000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(magicKnightWeapon.getItem(str: 4000, agi: 1700, eng: 4000).tier, 8, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 4000, agi: 10000, eng: 4000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(magicKnightWeapon.getItem(str: 5000, agi: 2000, eng: 5000).tier, 9, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 5000, agi: 10000, eng: 5000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(magicKnightWeapon.getItem(str: 6000, agi: 2500, eng: 6000).tier, 10, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 6000, agi: 10000, eng: 6000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(magicKnightWeapon.getItem(str: 7000, agi: 3000, eng: 7000).tier, 11, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 7000, agi: 10000, eng: 7000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(magicKnightWeapon.getItem(str: 8000, agi: 3500, eng: 8000).tier, 12, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 8000, agi: 10000, eng: 8000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(magicKnightWeapon.getItem(str: 10000, agi: 3700, eng: 10000).tier, 13, "is correct")
        XCTAssertEqual(magicKnightWeapon.getItem(str: 10000, agi: 10000, eng: 10000).tier, 13, "is correct")
        
    }
    
    func testSummonerWeapon() {
        
        // T0
        XCTAssertEqual(summonerWeapon.getItem(agi: 100, eng: 200).tier, nil, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 300, eng: 200).tier, nil, "is correct")
        
        // T5
        XCTAssertEqual(summonerWeapon.getItem(agi: 300, eng: 600).tier, 5, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 1000, eng: 600).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(summonerWeapon.getItem(agi: 800, eng: 1800).tier, 6, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 1800).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(summonerWeapon.getItem(agi: 1500, eng: 3000).tier, 7, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 3000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(summonerWeapon.getItem(agi: 1700, eng: 4000).tier, 8, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 4000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(summonerWeapon.getItem(agi: 2000, eng: 5000).tier, 9, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 5000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(summonerWeapon.getItem(agi: 2500, eng: 6000).tier, 10, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 6000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(summonerWeapon.getItem(agi: 3000, eng: 7000).tier, 11, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 7000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(summonerWeapon.getItem(agi: 3500, eng: 8000).tier, 12, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 8000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(summonerWeapon.getItem(agi: 3700, eng: 10000).tier, 13, "is correct")
        XCTAssertEqual(summonerWeapon.getItem(agi: 10000, eng: 10000).tier, 13, "is correct")
    }
}
