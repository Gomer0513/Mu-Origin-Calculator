//
//  FameTests.swift
//  Mu Origin Calculator Tests
//
//  Created by Oleksandr Kysil on 8/25/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import XCTest

@testable import Mu_Origin_Calculator
class FameTests: XCTestCase {
    
    var fame: Fame!
    
    override func setUp() {
        super.setUp()
        fame = Fame()
    }
    
    override func tearDown() {
        super.tearDown()
        fame = nil
    }
    
    func testpointsForFameTitles() {
        
        let pv1 = fame.evaluatePointsForTitle(currentTitle: Fames.pv1.name) // 9000
        let pv2 = fame.evaluatePointsForTitle(currentTitle: Fames.pv2.name) // 46000
        let pfc = fame.evaluatePointsForTitle(currentTitle: Fames.pfc.name) // 144000
        let spc = fame.evaluatePointsForTitle(currentTitle: Fames.spc.name) // 351000
        let cpl = fame.evaluatePointsForTitle(currentTitle: Fames.cpl.name) // 726000
        let sgt = fame.evaluatePointsForTitle(currentTitle: Fames.sgt.name) // 1345000
        let ssg = fame.evaluatePointsForTitle(currentTitle: Fames.ssg.name) // 2295000
        let sfc = fame.evaluatePointsForTitle(currentTitle: Fames.sfc.name) // 3675000
        let msg = fame.evaluatePointsForTitle(currentTitle: Fames.msg.name) // 5601000
        let firstSG = fame.evaluatePointsForTitle(currentTitle: Fames.firstSG.name) // 8201000
        let sgm = fame.evaluatePointsForTitle(currentTitle: Fames.sgm.name) // 11615000
        let csm = fame.evaluatePointsForTitle(currentTitle: Fames.csm.name) // 15997000
        let ltc = fame.evaluatePointsForTitle(currentTitle: Fames.ltc.name) // 15997000
        let col = fame.evaluatePointsForTitle(currentTitle: Fames.col.name) // 15997000
        let bg = fame.evaluatePointsForTitle(currentTitle: Fames.bg.name) // 15997000
        let mg = fame.evaluatePointsForTitle(currentTitle: Fames.mg.name) // 15997000
        
        XCTAssertEqual(pv1, Fames.pv1.value)
        XCTAssertEqual(pv2, Fames.pv2.value)
        XCTAssertEqual(pfc, Fames.pfc.value)
        XCTAssertEqual(spc, Fames.spc.value)
        XCTAssertEqual(cpl, Fames.cpl.value)
        XCTAssertEqual(sgt, Fames.sgt.value)
        XCTAssertEqual(ssg, Fames.ssg.value)
        XCTAssertEqual(sfc, Fames.sfc.value)
        XCTAssertEqual(msg, Fames.msg.value)
        XCTAssertEqual(firstSG, Fames.firstSG.value)
        XCTAssertEqual(sgm, Fames.sgm.value)
        XCTAssertEqual(csm, Fames.csm.value)
        XCTAssertEqual(ltc, Fames.ltc.value)
        XCTAssertEqual(col, Fames.col.value)
        XCTAssertEqual(bg, Fames.bg.value)
        XCTAssertEqual(mg, Fames.mg.value)
        
        XCTAssertEqual(Day(type: .FameBadge, points: pv1, diamondsPerDay: 200).evaluateDays(percentage: 100), 1) // 9000
        XCTAssertEqual(Day(type: .FameBadge, points: pv2, diamondsPerDay: 200).evaluateDays(percentage: 100), 4) // 46000
        XCTAssertEqual(Day(type: .FameBadge, points: pfc, diamondsPerDay: 200).evaluateDays(percentage: 100), 11) // 144000
        XCTAssertEqual(Day(type: .FameBadge, points: spc, diamondsPerDay: 200).evaluateDays(percentage: 100), 27) // 351000
        XCTAssertEqual(Day(type: .FameBadge, points: cpl, diamondsPerDay: 200).evaluateDays(percentage: 100), 55) // 726000
        XCTAssertEqual(Day(type: .FameBadge, points: sgt, diamondsPerDay: 200).evaluateDays(percentage: 100), 101) // 1345000
        XCTAssertEqual(Day(type: .FameBadge, points: ssg, diamondsPerDay: 200).evaluateDays(percentage: 100), 173) // 2295000
        XCTAssertEqual(Day(type: .FameBadge, points: sfc, diamondsPerDay: 200).evaluateDays(percentage: 100), 276) // 3675000
        XCTAssertEqual(Day(type: .FameBadge, points: msg, diamondsPerDay: 200).evaluateDays(percentage: 100), 421) // 5601000
        XCTAssertEqual(Day(type: .FameBadge, points: firstSG, diamondsPerDay: 200).evaluateDays(percentage: 100), 616) // 8201000
        XCTAssertEqual(Day(type: .FameBadge, points: sgm, diamondsPerDay: 200).evaluateDays(percentage: 100), 872) // 11615000
        XCTAssertEqual(Day(type: .FameBadge, points: csm, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 15997000
        XCTAssertEqual(Day(type: .FameBadge, points: ltc, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 15997000
        XCTAssertEqual(Day(type: .FameBadge, points: col, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 15997000
        XCTAssertEqual(Day(type: .FameBadge, points: bg, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 15997000
        XCTAssertEqual(Day(type: .FameBadge, points: mg, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 15997000
    }
}
