//
//  Achievements.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/20/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import Foundation

typealias AchievementBadge = Int

enum Achievements: AchievementBadge {
    case watcher = 4500
    case inquisitor = 23000
    case guardian = 72000
    case challenger = 175000
    case hunter = 363000
    case champion = 672500
    case invincible = 1147500
    case arbiter = 1837500
    case destroyer = 2800500
    case conqueror = 4100500
    case terminator = 5807500
    case immortal = 7998500
    case demolisher = 7998501
    case annihilator = 7998502
    case foreseer = 7998503
    case creator = 7998504
    
    var value: AchievementBadge {
        return self.rawValue
    }
    var name: String {
        switch self {
        case .watcher:
            return "Watcher"
        case .inquisitor:
            return "Inquisitor"
        case .guardian:
            return "Guardian"
        case .challenger:
            return "Challenger"
        case .hunter:
            return "Hunter"
        case .champion:
            return "Champion"
        case .invincible:
            return "Invictible"
        case .arbiter:
            return "Arbiter"
        case .destroyer:
            return "Destroyer"
        case .conqueror:
            return "Conqueror"
        case .terminator:
            return "Terminator"
        case .immortal:
            return "Immortal"
        case .demolisher:
            return "Demolisher"
        case .annihilator:
            return "Annihilator"
        case .foreseer:
            return "Foreseer"
        case .creator:
            return "Creator"
        }
    }
    static let valuesArray = [Achievement.watcher, Achievement.inquisitor, Achievement.guardian, Achievement.challenger, Achievement.hunter,Achievement.champion, Achievement.invincible, Achievement.arbiter, Achievement.destroyer, Achievement.conqueror, Achievement.terminator, Achievement.immortal, Achievement.demolisher, Achievement.annihilator, Achievement.foreseer, Achievement.creator]
    static let titlesArray = [Achievements.watcher.name, Achievements.inquisitor.name, Achievements.guardian.name, Achievements.challenger.name, Achievements.hunter.name, Achievements.champion.name, Achievements.invincible.name, Achievements.arbiter.name, Achievements.destroyer.name, Achievements.conqueror.name, Achievements.terminator.name, Achievements.immortal.name, Achievements.demolisher.name, Achievements.annihilator.name, Achievements.foreseer.name, Achievements.creator.name]
}

struct Achievement {
    static var watcher: AchievementBadge  = Achievements.watcher.value
    static var inquisitor: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value
    static var guardian: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value
    static var challenger: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value
    static var hunter: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value
    static var champion: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value +  Achievements.champion.value
    static var invincible: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value
    static var arbiter: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value
    static var destroyer: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value
    static var conqueror: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value
    static var terminator: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value + Achievements.terminator.value
    static var immortal: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value + Achievements.terminator.value + Achievements.immortal.value
    static var demolisher: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value + Achievements.terminator.value + Achievements.immortal.value + Achievements.demolisher.value
    static var annihilator: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value + Achievements.terminator.value + Achievements.immortal.value + Achievements.demolisher.value + Achievements.annihilator.value
    static var foreseer: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value + Achievements.terminator.value + Achievements.immortal.value + Achievements.demolisher.value + Achievements.annihilator.value + Achievements.foreseer.value
    static var creator: AchievementBadge = Achievements.watcher.value + Achievements.inquisitor.value + Achievements.guardian.value + Achievements.challenger.value + Achievements.hunter.value + Achievements.champion.value + Achievements.invincible.value + Achievements.arbiter.value + Achievements.destroyer.value + Achievements.conqueror.value + Achievements.terminator.value + Achievements.immortal.value + Achievements.demolisher.value + Achievements.annihilator.value + Achievements.foreseer.value + Achievements.creator.value
    
    func recalculatePoints(currentTitle: String, currentPoints: AchievementBadge) -> Array<(key:String, value:Int)> {
        var showTitleValues: [String:AchievementBadge] = [:]
        let startWith = Achievements.titlesArray.index(of: currentTitle)!
        
        for index in startWith+1..<Achievements.valuesArray.count {
            showTitleValues[Achievements.titlesArray[index]] = Achievements.valuesArray[index] - currentPoints - Achievements.valuesArray[startWith]
        }
        
        let sortedTitle = showTitleValues.sorted(by: {$0.value < $1.value})
        return sortedTitle
    }
    
    func evaluatePointsForTitle(currentTitle: String) -> AchievementBadge {
        let index = Achievements.titlesArray.index(of: currentTitle)!
        if index != 0 {
            return Achievements.valuesArray[index] - Achievements.valuesArray[index-1]
        } else {
            return Achievements.valuesArray[index]
        }
    }
}
