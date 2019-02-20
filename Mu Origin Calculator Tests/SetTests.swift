//
//  SetTests.swift
//  Mu Origin Calculator Tests
//
//  Created by Oleksandr Kysil on 8/7/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import XCTest

@testable import Mu_Origin_Calculator

class SetTests: XCTestCase {
    
    var darkKnightSet: Armor!
    var darkWizardSet: Armor!
    var elfSet: Armor!
    var magicKnightSet: Armor!
    var summonerSet: Armor!
    
    override func setUp() {
        super.setUp()
        
        darkKnightSet = Armor(belongsTo: .dk)
        darkWizardSet = Armor(belongsTo: .dw)
        elfSet = Armor(belongsTo: .elf)
        magicKnightSet = Armor(belongsTo: .mg)
        summonerSet = Armor(belongsTo: .sum)
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        darkKnightSet = nil
        darkWizardSet = nil
        elfSet = nil
        magicKnightSet = nil
        summonerSet = nil
    }
    
    func testDarkKnightSet() {
        
        // T1
        XCTAssertEqual(darkKnightSet.getItem(agi: 0, sta: 0).tier, 1, "is correct")
        
        // T2
        XCTAssertEqual(darkKnightSet.getItem(agi: 0, sta: 1000).tier, 2, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 10, sta: 1000).tier, 2, "is correct")
        
        // T3
        XCTAssertEqual(darkKnightSet.getItem(agi: 130, sta: 200).tier, 3, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 130, sta: 1000).tier, 3, "is correct")
        
        // T4
        XCTAssertEqual(darkKnightSet.getItem(agi: 300, sta: 400).tier, 4, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 300, sta: 1000).tier, 4, "is correct")
        
        // T5
        XCTAssertEqual(darkKnightSet.getItem(agi: 500, sta: 700).tier, 5, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 500, sta: 1000).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(darkKnightSet.getItem(agi: 800, sta: 1100).tier, 6, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 800, sta: 10000).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(darkKnightSet.getItem(agi: 1100, sta: 2000).tier, 7, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 1100, sta: 10000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(darkKnightSet.getItem(agi: 1700, sta: 2500).tier, 8, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 1700, sta: 10000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(darkKnightSet.getItem(agi: 2000, sta: 3000).tier, 9, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 2000, sta: 10000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(darkKnightSet.getItem(agi: 2500, sta: 3500).tier, 10, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 2500, sta: 10000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(darkKnightSet.getItem(agi: 3000, sta: 4500).tier, 11, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 3000, sta: 10000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(darkKnightSet.getItem(agi: 3500, sta: 5000).tier, 12, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 3500, sta: 10000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(darkKnightSet.getItem(agi: 4000, sta: 6000).tier, 13, "is correct")
        XCTAssertEqual(darkKnightSet.getItem(agi: 5000, sta: 6000).tier, 13, "is correct")
        
    }
    
    func testDarkWizardSet() {
        
        // T1
        XCTAssertEqual(darkWizardSet.getItem(agi: 0, sta: 0).tier, 1, "is correct")
        
        // T2
        XCTAssertEqual(darkWizardSet.getItem(agi: 0, sta: 1000).tier, 2, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 10, sta: 1000).tier, 2, "is correct")
        
        // T3
        XCTAssertEqual(darkWizardSet.getItem(agi: 130, sta: 200).tier, 3, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 130, sta: 1000).tier, 3, "is correct")
        
        // T4
        XCTAssertEqual(darkWizardSet.getItem(agi: 300, sta: 400).tier, 4, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 300, sta: 1000).tier, 4, "is correct")
        
        // T5
        XCTAssertEqual(darkWizardSet.getItem(agi: 500, sta: 700).tier, 5, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 500, sta: 1000).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(darkWizardSet.getItem(agi: 800, sta: 1100).tier, 6, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 800, sta: 10000).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(darkWizardSet.getItem(agi: 1100, sta: 2000).tier, 7, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 1100, sta: 10000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(darkWizardSet.getItem(agi: 1700, sta: 2500).tier, 8, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 1700, sta: 10000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(darkWizardSet.getItem(agi: 2000, sta: 3000).tier, 9, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 2000, sta: 10000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(darkWizardSet.getItem(agi: 2500, sta: 3500).tier, 10, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 2500, sta: 10000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(darkWizardSet.getItem(agi: 3000, sta: 4500).tier, 11, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 3000, sta: 10000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(darkWizardSet.getItem(agi: 3500, sta: 5000).tier, 12, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 3500, sta: 10000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(darkWizardSet.getItem(agi: 4000, sta: 6000).tier, 13, "is correct")
        XCTAssertEqual(darkWizardSet.getItem(agi: 5000, sta: 6000).tier, 13, "is correct")
        
    }
    
    func testElfSet() {
        
        // T1
        XCTAssertEqual(elfSet.getItem(agi: 0, sta: 0).tier, 1, "is correct")
        
        // T2
        XCTAssertEqual(elfSet.getItem(agi: 0, sta: 1000).tier, 2, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 10, sta: 1000).tier, 2, "is correct")
        
        // T3
        XCTAssertEqual(elfSet.getItem(agi: 130, sta: 200).tier, 3, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 130, sta: 1000).tier, 3, "is correct")
        
        // T4
        XCTAssertEqual(elfSet.getItem(agi: 300, sta: 400).tier, 4, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 300, sta: 1000).tier, 4, "is correct")
        
        // T5
        XCTAssertEqual(elfSet.getItem(agi: 500, sta: 700).tier, 5, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 500, sta: 1000).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(elfSet.getItem(agi: 800, sta: 1100).tier, 6, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 800, sta: 10000).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(elfSet.getItem(agi: 1100, sta: 2000).tier, 7, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 1100, sta: 10000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(elfSet.getItem(agi: 1700, sta: 2500).tier, 8, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 1700, sta: 10000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(elfSet.getItem(agi: 2000, sta: 3000).tier, 9, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 2000, sta: 10000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(elfSet.getItem(agi: 2500, sta: 3500).tier, 10, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 2500, sta: 10000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(elfSet.getItem(agi: 3000, sta: 4500).tier, 11, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 3000, sta: 10000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(elfSet.getItem(agi: 3500, sta: 5000).tier, 12, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 3500, sta: 10000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(elfSet.getItem(agi: 4000, sta: 6000).tier, 13, "is correct")
        XCTAssertEqual(elfSet.getItem(agi: 5000, sta: 6000).tier, 13, "is correct")
        
    }
    
    func testMagicKnightSet() {
        
        // T0
        XCTAssertEqual(magicKnightSet.getItem(str: 100, agi: 100, eng: 100, sta: 100).tier, nil, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 1000, agi: 1000, eng: 100, sta: 100).tier, nil, "is correct")
        
        // T5
        XCTAssertEqual(magicKnightSet.getItem(str: 250, agi: 250, eng: 250, sta: 350).tier, 5, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 250, agi: 250, eng: 250, sta: 1000).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(magicKnightSet.getItem(str: 400, agi: 800, eng: 400, sta: 1100).tier, 6, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 400, agi: 800, eng: 400, sta: 10000).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(magicKnightSet.getItem(str: 600, agi: 1100, eng: 600, sta: 2000).tier, 7, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 600, agi: 1100, eng: 600, sta: 10000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(magicKnightSet.getItem(str: 800, agi: 1600, eng: 800, sta: 2500).tier, 8, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 800, agi: 1600, eng: 800, sta: 10000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(magicKnightSet.getItem(str: 1000, agi: 2000, eng: 1000, sta: 3000).tier, 9, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 1000, agi: 2000, eng: 1000, sta: 10000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(magicKnightSet.getItem(str: 1200, agi: 2500, eng: 1200, sta: 4000).tier, 10, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 1200, agi: 2500, eng: 1200, sta: 10000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(magicKnightSet.getItem(str: 1500, agi: 3000, eng: 1500, sta: 4500).tier, 11, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 1500, agi: 3000, eng: 1500, sta: 10000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(magicKnightSet.getItem(str: 1600, agi: 3500, eng: 1600, sta: 5000).tier, 12, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 1600, agi: 3500, eng: 1600, sta: 5000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(magicKnightSet.getItem(str: 2000, agi: 4000, eng: 2000, sta: 6000).tier, 13, "is correct")
        XCTAssertEqual(magicKnightSet.getItem(str: 2000, agi: 4000, eng: 2000, sta: 10000).tier, 13, "is correct")
        
    }
    
    func testSummonerSet() {
        
        // T0
        XCTAssertEqual(summonerSet.getItem(agi: 100, eng: 100, sta: 100).tier, nil, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 1000, eng: 100, sta: 100).tier, nil, "is correct")
        
        // T5
        XCTAssertEqual(summonerSet.getItem(agi: 250, eng: 250, sta: 350).tier, 5, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 250, eng: 250, sta: 1000).tier, 5, "is correct")
        
        // T6
        XCTAssertEqual(summonerSet.getItem(agi: 800, eng: 400, sta: 1100).tier, 6, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 800, eng: 400, sta: 10000).tier, 6, "is correct")
        
        // T7
        XCTAssertEqual(summonerSet.getItem(agi: 1100, eng: 600, sta: 2000).tier, 7, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 1100, eng: 600, sta: 10000).tier, 7, "is correct")
        
        // T8
        XCTAssertEqual(summonerSet.getItem(agi: 1600, eng: 800, sta: 2500).tier, 8, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 1600, eng: 800, sta: 10000).tier, 8, "is correct")
        
        // T9
        XCTAssertEqual(summonerSet.getItem(agi: 2000, eng: 1000, sta: 3000).tier, 9, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 2000, eng: 1000, sta: 10000).tier, 9, "is correct")
        
        // T10
        XCTAssertEqual(summonerSet.getItem(agi: 2500, eng: 1200, sta: 4000).tier, 10, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 2500, eng: 1200, sta: 10000).tier, 10, "is correct")
        
        // T11
        XCTAssertEqual(summonerSet.getItem(agi:3000, eng: 1500, sta: 4500).tier, 11, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi:3000, eng: 1500, sta: 10000).tier, 11, "is correct")
        
        // T12
        XCTAssertEqual(summonerSet.getItem(agi: 3500, eng: 1600, sta: 5000).tier, 12, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 3500, eng: 1600, sta: 5000).tier, 12, "is correct")
        
        // T13
        XCTAssertEqual(summonerSet.getItem(agi: 4000, eng: 2000, sta: 6000).tier, 13, "is correct")
        XCTAssertEqual(summonerSet.getItem(agi: 4000, eng: 2000, sta: 10000).tier, 13, "is correct")
        
    }
}
