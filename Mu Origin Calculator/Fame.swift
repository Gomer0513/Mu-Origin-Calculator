//
//  Fame.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/20/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import Foundation

typealias FameBadge = Int

enum Fames: FameBadge {
    case pv1 = 9000
    case pv2 = 46000
    case pfc = 144000
    case spc = 351000
    case cpl = 726000
    case sgt = 1345000
    case ssg = 2295000
    case sfc = 3675000
    case msg = 5601000
    case firstSG = 8201000
    case sgm = 11615000
    case csm = 15997000
    case ltc = 15997001
    case col = 15997002
    case bg = 15997003
    case mg = 15997004
    
    // MARK: - Variables
    
    var value: FameBadge {
        return rawValue
    }
    var name: String {
        switch self {
        case .pv1:
            return "PV1"
        case .pv2:
            return "PV2"
        case .pfc:
            return "PFC"
        case .spc:
            return "SPC"
        case .cpl:
            return "CPL"
        case .sgt:
            return "SGT"
        case .ssg:
            return "SSG"
        case .sfc:
            return "SFC"
        case .msg:
            return "MSG"
        case .firstSG:
            return "1SG"
        case .sgm:
            return "SGM"
        case .csm:
            return "CSM"
        case .ltc:
            return "LTC"
        case .col:
            return "COL"
        case .bg:
            return "BG"
        case .mg:
            return "MG"
        }
    }
    
    // MARK: - Constants
    
    static let valuesArray = [Fame.pv1, Fame.pv2, Fame.pfc, Fame.spc, Fame.cpl, Fame.sgt, Fame.ssg, Fame.sfc, Fame.msg, Fame.firstSG, Fame.sgm, Fame.csm, Fame.ltc, Fame.col, Fame.bg, Fame.mg]
    static let titlesArray = [Fames.pv1.name, Fames.pv2.name, Fames.pfc.name, Fames.spc.name, Fames.cpl.name, Fames.sgt.name, Fames.ssg.name, Fames.sfc.name, Fames.msg.name, Fames.firstSG.name, Fames.sgm.name, Fames.csm.name, Fames.ltc.name, Fames.col.name, Fames.bg.name, Fames.mg.name]
}

struct Fame {
    
    // MARK: - Variables
    
    static var pv1: FameBadge = Fames.pv1.value
    static var pv2: FameBadge = Fames.pv1.value + Fames.pv2.value
    static var pfc: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value
    static var spc: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value
    static var cpl: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value
    static var sgt: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value
    static var ssg: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value
    static var sfc: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value
    static var msg: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value
    static var firstSG: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value
    static var sgm: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value + Fames.sgm.value
    static var csm: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value + Fames.sgm.value + Fames.csm.value
    static var ltc: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value + Fames.sgm.value + Fames.csm.value + Fames.ltc.value
    static var col: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value + Fames.sgm.value + Fames.csm.value + Fames.ltc.value + Fames.col.value
    static var bg: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value + Fames.sgm.value + Fames.csm.value + Fames.ltc.value + Fames.col.value + Fames.bg.value
    static var mg: FameBadge = Fames.pv1.value + Fames.pv2.value + Fames.pfc.value + Fames.spc.value + Fames.cpl.value + Fames.sgt.value + Fames.ssg.value + Fames.sfc.value + Fames.msg.value + Fames.firstSG.value + Fames.sgm.value + Fames.csm.value + Fames.ltc.value + Fames.col.value + Fames.bg.value + Fames.mg.value
    
    // MARK: - Methods
    
    func recalculatePoints(currentTitle: String, currentPoints: FameBadge) -> Array<(key:String, value:Int)> {
        var showTitleValues: [String:FameBadge] = [:]
        let startWith = Fames.titlesArray.firstIndex(of: currentTitle)!
        
        for index in startWith+1..<Fames.valuesArray.count {
            showTitleValues[Fames.titlesArray[index]] = Fames.valuesArray[index] - currentPoints - Fames.valuesArray[startWith]
        }
        
        let sortedTitle = showTitleValues.sorted(by: {$0.value < $1.value})
        return sortedTitle
    }
    
    func evaluatePointsForTitle(currentTitle: String) -> FameBadge {
        let index = Fames.titlesArray.firstIndex(of: currentTitle)!
        if index != 0 {
            return Fames.valuesArray[index] - Fames.valuesArray[index-1]
        } else {
            return Fames.valuesArray[index]
        }
    }
}
