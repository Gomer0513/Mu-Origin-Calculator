//
//  AchievementTests.swift
//  Mu Origin Calculator Tests
//
//  Created by Oleksandr Kysil on 8/24/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import XCTest

@testable import Mu_Origin_Calculator
class AchievementTests: XCTestCase {
    
    var achievement: Achievement!
    
    override func setUp() {
        super.setUp()
        achievement = Achievement()
    }
    
    override func tearDown() {
        super.tearDown()
        achievement = nil
    }
    
    func testPointsForTitle() {
        let watcher = achievement.evaluatePointsForTitle(currentTitle: Achievements.watcher.name)
        let inquisitor = achievement.evaluatePointsForTitle(currentTitle: Achievements.inquisitor.name)
        let guardian = achievement.evaluatePointsForTitle(currentTitle: Achievements.guardian.name)
        let challenger = achievement.evaluatePointsForTitle(currentTitle: Achievements.challenger.name)
        let hunter = achievement.evaluatePointsForTitle(currentTitle: Achievements.hunter.name)
        let champion = achievement.evaluatePointsForTitle(currentTitle: Achievements.champion.name)
        let invincible = achievement.evaluatePointsForTitle(currentTitle: Achievements.invincible.name)
        let arbiter = achievement.evaluatePointsForTitle(currentTitle: Achievements.arbiter.name)
        let destroyer = achievement.evaluatePointsForTitle(currentTitle: Achievements.destroyer.name)
        let conqueror = achievement.evaluatePointsForTitle(currentTitle: Achievements.conqueror.name)
        let terminator = achievement.evaluatePointsForTitle(currentTitle: Achievements.terminator.name)
        let immortal = achievement.evaluatePointsForTitle(currentTitle: Achievements.immortal.name)
        let demolisher = achievement.evaluatePointsForTitle(currentTitle: Achievements.demolisher.name)
        let annihilator = achievement.evaluatePointsForTitle(currentTitle: Achievements.annihilator.name)
        let foreseer = achievement.evaluatePointsForTitle(currentTitle: Achievements.foreseer.name)
        let сreator = achievement.evaluatePointsForTitle(currentTitle: Achievements.creator.name)
        
        XCTAssertEqual(watcher, Achievements.watcher.value)
        XCTAssertEqual(inquisitor, Achievements.inquisitor.value)
        XCTAssertEqual(guardian, Achievements.guardian.value)
        XCTAssertEqual(challenger, Achievements.challenger.value)
        XCTAssertEqual(hunter, Achievements.hunter.value)
        XCTAssertEqual(champion, Achievements.champion.value)
        XCTAssertEqual(invincible, Achievements.invincible.value)
        XCTAssertEqual(arbiter, Achievements.arbiter.value)
        XCTAssertEqual(destroyer, Achievements.destroyer.value)
        XCTAssertEqual(conqueror, Achievements.conqueror.value)
        XCTAssertEqual(terminator, Achievements.terminator.value)
        XCTAssertEqual(immortal, Achievements.immortal.value)
        XCTAssertEqual(demolisher, Achievements.demolisher.value)
        XCTAssertEqual(annihilator, Achievements.annihilator.value)
        XCTAssertEqual(foreseer, Achievements.foreseer.value)
        XCTAssertEqual(сreator, Achievements.creator.value)
        
        XCTAssertEqual(Day(type: .AchievementBadge, points: watcher, diamondsPerDay: 200).evaluateDays(percentage: 100), 1) // 4500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: inquisitor, diamondsPerDay: 200).evaluateDays(percentage: 100), 4) // 23000 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: guardian, diamondsPerDay: 200).evaluateDays(percentage: 100), 11) // 72000 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: challenger, diamondsPerDay: 200).evaluateDays(percentage: 100), 27) // 175000 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: hunter, diamondsPerDay: 200).evaluateDays(percentage: 100), 55) // 363000 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: champion, diamondsPerDay: 200).evaluateDays(percentage: 100), 101) // 672500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: invincible, diamondsPerDay: 200).evaluateDays(percentage: 100), 173) // 1147500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: arbiter, diamondsPerDay: 200).evaluateDays(percentage: 100), 276) // 1837500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: destroyer, diamondsPerDay: 200).evaluateDays(percentage: 100), 421) // 2800500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: conqueror, diamondsPerDay: 200).evaluateDays(percentage: 100), 616) // 4100500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: terminator, diamondsPerDay: 200).evaluateDays(percentage: 100), 872) // 5807500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: immortal, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 7998500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: demolisher, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 7998500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: annihilator, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 7998500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: foreseer, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 7998500 points
        XCTAssertEqual(Day(type: .AchievementBadge, points: сreator, diamondsPerDay: 200).evaluateDays(percentage: 100), 1200) // 7998500 points
        
    }
}
