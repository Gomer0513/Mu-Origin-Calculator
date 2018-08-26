//
//  FlameTests.swift
//  Mu Origin Calculator Tests
//
//  Created by Oleksandr Kysil on 8/26/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import XCTest

@testable import Mu_Origin_Calculator
class FlameTests: XCTestCase {
    
    var flame: Wing!
    
    override func setUp() {
        super.setUp()
        flame = Wing()
    }
    
    override func tearDown() {
        super.tearDown()
        flame = nil
    }
    
    func testpointsForWingTitles() {
        let tier1 = flame.evaluatePointsForTitle(currentTitle: Wings.tier1.name)
        let tier2 = flame.evaluatePointsForTitle(currentTitle: Wings.tier2.name)
        let tier3 = flame.evaluatePointsForTitle(currentTitle: Wings.tier3.name)
        let tier4 = flame.evaluatePointsForTitle(currentTitle: Wings.tier4.name)
        let tier5 = flame.evaluatePointsForTitle(currentTitle: Wings.tier5.name)
        let tier6 = flame.evaluatePointsForTitle(currentTitle: Wings.tier6.name)
        let tier7 = flame.evaluatePointsForTitle(currentTitle: Wings.tier7.name)
        let tier8 = flame.evaluatePointsForTitle(currentTitle: Wings.tier8.name)
        
        XCTAssertEqual(Day(type: .CondorFlame, points: tier1, diamondsPerDay: 200).evaluateDays(percentage: 100), 3) // 14
        XCTAssertEqual(Day(type: .CondorFlame, points: tier2, diamondsPerDay: 200).evaluateDays(percentage: 100), 14) // 90
        XCTAssertEqual(Day(type: .CondorFlame, points: tier3, diamondsPerDay: 200).evaluateDays(percentage: 100), 44) // 291
        XCTAssertEqual(Day(type: .CondorFlame, points: tier4, diamondsPerDay: 200).evaluateDays(percentage: 100), 106) // 702
        XCTAssertEqual(Day(type: .CondorFlame, points: tier5, diamondsPerDay: 200).evaluateDays(percentage: 100), 222) // 1478
        XCTAssertEqual(Day(type: .CondorFlame, points: tier6, diamondsPerDay: 200).evaluateDays(percentage: 100), 401) // 2670
        XCTAssertEqual(Day(type: .CondorFlame, points: tier7, diamondsPerDay: 200).evaluateDays(percentage: 100), 699) // 4660
        XCTAssertEqual(Day(type: .CondorFlame, points: tier8, diamondsPerDay: 200).evaluateDays(percentage: 100), 1149) // 7660
    }
    
}
