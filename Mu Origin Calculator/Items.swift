//
//  Items.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 2/25/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import Foundation

struct Item {
    var name: String?
    var str: Point?
    var agi: Point?
    var eng: Point?
    var sta: Point?
    var tier: Int?
}

protocol Items {
    var belongsTo: Classes {get set}
    var item: Item {get set}
    
    func getItem(str: Point?, agi: Point?, eng: Point?, sta: Point?) -> (tier: Int?, name: String?)
}

class Weapon: Items {
    var belongsTo: Classes
    var item = Item()
    
    init(belongsTo: Classes) {
        self.belongsTo = belongsTo
    }
    
    func getItem(str: Point? = nil ?? 0, agi: Point? = nil ?? 0, eng: Point? = nil ?? 0, sta: Point? = nil ?? 0) -> (tier: Int?, name: String?) {
        if str != nil {
            item.str = str!
        }
        if agi != nil {
            item.agi = agi!
        }
        if eng != nil {
            item.eng = eng!
        }
        if sta != nil {
            item.sta = sta!
        }
        
        switch belongsTo {
        case .dk:
            if (item.str! == 2) && (item.agi! <= 0) {
                item.name = "Gladius or Serpent Spear"
                item.tier = 1
                return (item.tier,item.name)
            }
            if (item.str! >= 2 && item.agi! < 128) || ((item.str! >= 2 && item.str! < 320) && item.agi! >= 0) {
                item.name = "Tomahawk or Falchion"
                item.tier = 2
                return (item.tier,item.name)
            }
            if (item.str! >= 320 && (item.agi! >= 128 && item.agi! < 256)) || ((item.str! >= 320 && item.str! < 640) && item.agi! >= 128) {
                item.name = "Giant Sword, Blade, Cobra Spear"
                item.tier = 3
                return (item.tier,item.name)
            }
            if (item.str! >= 640 && (item.agi! >= 256 && item.agi! < 442)) || ((item.str! >= 640 && item.str! < 1104) && item.agi! >= 256) {
                item.name = "Legendary Sword, Crescent Axe"
                item.tier = 4
                return (item.tier,item.name)
            }
            if (item.str! >= 1104 && (item.agi! >= 442 && item.agi! < 704)) || ((item.str! >= 1104 && item.str! < 1760) && item.agi! >= 442) {
                item.name = "Double Blade, Chaos Dragon Axe, Barlog's Scythe"
                item.tier = 5
                return (item.tier,item.name)
            }
            if (item.str! >= 1760 && (item.agi! >= 704 && item.agi! < 1062)) || ((item.str! >= 1760 && item.str! < 2656) && item.agi! >= 704) {
                item.name = "Lightning Sword, Crystal Morning Star, Black Dragon's Scythe"
                item.tier = 6
                return (item.tier,item.name)
            }
            if (item.str! >= 2656 && (item.agi! >= 1062 && item.agi! < 1546)) || ((item.str! >= 2656 && item.str! < 3864) && item.agi! >= 1062) {
                item.name = "Sword of Destruction, Dragon Spear, Crystal Sword"
                item.tier = 7
                return (item.tier,item.name)
            }
            if (item.str! >= 3864 && (item.agi! >= 1546 && item.agi! < 1907)) || ((item.str! >= 3864 && item.str! < 4768) && item.agi! >= 1546) {
                item.name = "Knight's Blade, Magma Spear, Daybreak"
                item.tier = 8
                return (item.tier,item.name)
            }
            if (item.str! >= 4768 && (item.agi! >= 1907 && item.agi! < 2301)) || ((item.str! >= 4768 && item.str! < 5752) && item.agi! >= 1907) {
                item.name = "Dark Breaker, Chaos Scythe, Bone Blade"
                item.tier = 9
                return (item.tier,item.name)
            }
            if (item.str! >= 5752 && (item.agi! >= 2301 && item.agi! < 2726)) || ((item.str! >= 5752 && item.str! < 6816) && item.agi! >= 2301) {
                item.name = "Helios Sword, Divine Scythe"
                item.tier = 10
                return (item.tier,item.name)
            }
            if (item.str! >= 6816 && (item.agi! >= 2726 && item.agi! < 3184)) || ((item.str! >= 6816 && item.str! < 7960) && item.agi! >= 2726) {
                item.name = "Dark Breaker, Chaos Scythe, Bone Blade"
                item.tier = 11
                return (item.tier,item.name)
            }
            if (item.str! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.str! >= 7960 && item.str! < 9184) && item.agi! >= 3184) {
                item.name = "Immortal Sword"
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.str! >= 9184) && (item.agi! >= 3674) {
                item.name = "Bloodthirst Sword"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .dw:
            if (item.eng! <= 0) && (item.agi! <= 0) {
                return (nil,nil)
            }
            if (item.eng! >= 2 && item.agi! < 128) || ((item.eng! >= 2 && item.eng! < 320) && (item.agi! > 0)) {
                item.name = "White Wand, Angel Staff"
                item.tier = 2
                return (item.tier,item.name)
            }
            if (item.eng! >= 320 && (item.agi! >= 128 && item.agi! < 256)) || ((item.eng! >= 320 && item.eng! < 640) && item.agi! >= 128) {
                item.name = "Devil Wand, Gordon Staff"
                item.tier = 3
                return (item.tier,item.name)
            }
            if (item.eng! >= 640 && (item.agi! >= 256 && item.agi! < 442)) || ((item.eng! >= 640 && item.eng! < 1104) && item.agi! >= 256) {
                item.name = "Wand of Resurrection, Thunder Staff"
                item.tier = 4
                return (item.tier,item.name)
            }
            if (item.eng! >= 1104 && (item.agi! >= 442 && item.agi! < 704)) || ((item.eng! >= 1104 && item.eng! < 1760) && item.agi! >= 442) {
                item.name = "Legendary Wand, Chaos Lightning Staff"
                item.tier = 5
                return (item.tier,item.name)
            }
            if (item.eng! >= 1760 && (item.agi! >= 704 && item.agi! < 1062)) || ((item.eng! >= 1760 && item.eng! < 2656) && item.agi! >= 704) {
                item.name = "Phantom Wand, Staff of Destruction"
                item.tier = 6
                return (item.tier,item.name)
            }
            if (item.eng! >= 2656 && (item.agi! >= 1062 && item.agi! < 1546)) || ((item.eng! >= 2656 && item.eng! < 3864) && item.agi! >= 1062) {
                item.name = "Dragon Soul Wand, Staff Of Kundum"
                item.tier = 7
                return (item.tier,item.name)
            }
            if (item.eng! >= 3864 && (item.agi! >= 1546 && item.agi! < 1907)) || ((item.eng! >= 3864 && item.eng! < 4768) && item.agi! >= 1546) {
                item.name = "Nether Wand, Platinum Wing Staff"
                item.tier = 8
                return (item.tier,item.name)
            }
            if (item.eng! >= 4768 && (item.agi! >= 1907 && item.agi! < 2301)) || ((item.eng! >= 4768 && item.eng! < 5752) && item.agi! >= 1907){
                item.name = "Deadly Wand, Miracle Staff"
                item.tier = 9
                return (item.tier,item.name)
            }
            if (item.eng! >= 5752 && (item.agi! >= 2301 && item.agi! < 2726)) || ((item.eng! >= 5752 && item.eng! < 6816) && item.agi! >= 2301) {
                item.name = "Deathbringer Wand, Nighmare Staff"
                item.tier = 10
                return (item.tier,item.name)
            }
            if (item.eng! >= 6816 && (item.agi! >= 2726 && item.agi! < 3184)) || ((item.eng! >= 6816 && item.eng! < 7960) && item.agi! >= 2726) {
                item.name = "Tartaros Wand, Harmagedon Staff"
                item.tier = 11
                return (item.tier,item.name)
            }
            if (item.eng! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.eng! >= 7960 && item.eng! < 9184) && item.agi! >= 3184) {
                item.name = "Demigod's Wand, Staff of Lampas"
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.eng! >= 9184) && (item.agi! >= 3674) {
                item.name = "Eternal Wand, Resurrection Staff"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .elf:
            if (item.str! < 2) && (item.agi! <= 0) {
                item.name = "Crossbow"
                item.tier = 1
                return (item.tier,item.name)
            }
            if (item.str! >= 2 && (item.agi! < 128)) || ((item.str! >= 2 && item.str! < 320) && item.agi! > 0) {
                item.name = "Golden Crossbow"
                item.tier = 2
                return (item.tier,item.name)
            }
            if (item.str! >= 320 && (item.agi! >= 128 && item.agi! < 256)) || ((item.str! >= 320 && item.str! < 640) && item.agi! >= 128) {
                item.name = "Tight Crossbow"
                item.tier = 3
                return (item.tier,item.name)
            }
            if (item.str! >= 640 && (item.agi! >= 256 && item.agi! < 442)) || ((item.str! >= 640 && item.str! < 1104) && item.agi! >= 256) {
                item.name = "Serpent Crossbow"
                item.tier = 4
                return (item.tier,item.name)
            }
            if (item.str! >= 1104 && (item.agi! >= 442 && item.agi! < 704)) || ((item.str! >= 1104 && item.str! < 1760) && item.agi! >= 442) {
                item.name = "Blue Wing Crossbow"
                item.tier = 5
                return (item.tier,item.name)
            }
            if (item.str! >= 1760 && (item.agi! >= 704 && item.agi! < 1062)) || ((item.str! >= 1760 && item.str! < 2656) && item.agi! >= 704) {
                item.name = "Aqua Gold Crossbow"
                item.tier = 6
                return (item.tier,item.name)
            }
            if (item.str! >= 2656 && (item.agi! >= 1062 && item.agi! < 1546)) || ((item.str! >= 2656 && item.str! < 3864) && item.agi! >= 1062) {
                item.name = "Saint's Crossbow"
                item.tier = 7
                return (item.tier,item.name)
            }
            if (item.str! >= 3864 && (item.agi! >= 1546 && item.agi! < 1907)) || ((item.str! >= 3864 && item.str! < 4768) && item.agi! >= 1546) {
                item.name = "Great Reign Crossbow"
                item.tier = 8
                return (item.tier,item.name)
            }
            if (item.str! >= 4768 && (item.agi! >= 1907 && item.agi! < 2301)) || ((item.str! >= 4768 && item.str! < 5752) && item.agi! >= 1907) {
                item.name = "Devil Crossbow"
                item.tier = 9
                return (item.tier,item.name)
            }
            if (item.str! >= 5752 && (item.agi! >= 2301 && item.agi! < 2726)) || ((item.str! >= 5752 && item.str! < 6816) && item.agi! >= 2301) {
                item.name = "Sky Soul Crossbow"
                item.tier = 10
                return (item.tier,item.name)
            }
            if (item.str! >= 6816 && (item.agi! >= 2726 && item.agi! < 3184)) || ((item.str! >= 6816 && item.str! < 7960) && item.agi! >= 2726) {
                item.name = "Alaeboss Crossbow"
                item.tier = 11
                return (item.tier,item.name)
            }
            if (item.str! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.str! >= 7960 && item.str! < 9184) && item.agi! >= 3184) {
                item.name = "Artemis Crossbow"
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.str! >= 9184) && (item.agi! >= 3674) {
                item.name = "Raging Gale Crossbow"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .mg:
            if ((item.str! < 544) || (item.eng! < 544)) && (item.agi! < 217) {
                return (nil,nil)
            }
            if ((item.str! >= 544 || item.eng! >= 544) && (item.agi! >= 217 && item.agi! < 704)) || (((item.str! >= 544 && item.str! < 1760) || (item.eng! >= 544 && item.eng! < 1760)) && item.agi! >= 217) {
                item.name = "Rune Bastard"
                item.tier = 5
                return (item.tier,item.name)
            }
            if ((item.str! >= 1760 || item.eng! >= 1760) && (item.agi! >= 704 && item.agi! < 1062)) || (((item.str! >= 1760 && item.str! < 2656) || (item.eng! >= 1760 && item.eng! < 2656)) && item.agi! >= 704) {
                item.name = "Sword Dancer"
                item.tier = 6
                return (item.tier,item.name)
            }
            if ((item.str! >= 2656 || item.eng! >= 2656) && (item.agi! >= 1062 && item.agi! < 1546)) || (((item.str! >= 2656 && item.str! < 3864) || (item.eng! >= 2656 && item.eng! < 3864)) && item.agi! >= 1062) {
                item.name = "Asura"
                item.tier = 7
                return (item.tier,item.name)
            }
            if ((item.str! >= 3864 || item.eng! >= 3864) && (item.agi! >= 1546 && item.agi! < 1907)) || (((item.str! >= 3864 && item.str! < 4768) || (item.eng! >= 3864 && item.eng! < 4768)) && item.agi! >= 1546) {
                item.name = "Death Blade"
                item.tier = 8
                return (item.tier,item.name)
            }
            if ((item.str! >= 4768 || item.eng! >= 4768) && (item.agi! >= 1907 && item.agi! < 2301)) || (((item.str! >= 4768 && item.str! < 5752) || (item.eng! >= 4768 && item.eng! < 5752)) && item.agi! >= 1907) {
                item.name = "Explosive Blade"
                item.tier = 9
                return (item.tier,item.name)
            }
            if ((item.str! >= 5752 || item.eng! >= 5752) && (item.agi! >= 2301 && item.agi! < 2726)) || (((item.str! >= 5752 && item.str! < 6816) || (item.eng! >= 5752 && item.eng! < 6816)) && item.agi! >= 2301) {
                item.name = "Thunder Blade"
                item.tier = 10
                return (item.tier,item.name)
            }
            if ((item.str! >= 6816 || item.eng! >= 6816) && (item.agi! >= 2726 && item.agi! < 3184)) || (((item.str! >= 6816 && item.str! < 7960) || (item.eng! >= 6816 && item.eng! < 7960)) && item.agi! >= 2726) {
                item.name = "Blast Break"
                item.tier = 11
                return (item.tier,item.name)
            }
            if ((item.str! >= 7960 || item.eng! >= 7960) && (item.agi! >= 3184 && item.agi! < 3674)) || (((item.str! >= 7960 && item.str! < 9184) || (item.eng! >= 7960 && item.eng! < 9184)) && item.agi! >= 3184) {
                item.name = "Sword of Varus"
                item.tier = 12
                return (item.tier,item.name)
            }
            if ((item.str! >= 9184) || (item.eng! >= 9184)) && (item.agi! >= 3674) {
                item.name = "Infinite Bastard"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .sum:
            if ((item.str! < 544) || (item.eng! < 544)) && (item.agi! < 217) {
                return (nil,nil)
            }
            if (item.eng! >= 544 && (item.agi! >= 217 && item.agi! < 704)) || ((item.eng! >= 544 && item.eng! < 1760) && item.agi! >= 217) {
                item.name = "Zephyrus Rod"
                item.tier = 5
                return (item.tier,item.name)
            }
            if (item.eng! >= 1760 && (item.agi! >= 704 && item.agi! < 1062)) || ((item.eng! >= 1760 && item.eng! < 2656) && item.agi! >= 704) {
                item.name = "Red Wing Rod"
                item.tier = 6
                return (item.tier,item.name)
            }
            if (item.eng! >= 2656 && (item.agi! >= 1062 && item.agi! < 1546)) || ((item.eng! >= 2656 && item.eng! < 3864) && item.agi! >= 1062) {
                item.name = "Ancient Rod"
                item.tier = 7
                return (item.tier,item.name)
            }
            if (item.eng! >= 3864 && (item.agi! >= 1546 && item.agi! < 1907)) || ((item.eng! >= 3864 && item.eng! < 4768) && item.agi! >= 1546) {
                item.name = "Eternal Rod"
                item.tier = 8
                return (item.tier,item.name)
            }
            if (item.eng! >= 4768 && (item.agi! >= 1907 && item.agi! < 2301)) || ((item.eng! >= 4768 && item.eng! < 5752) && item.agi! >= 1907){
                item.name = "Dream Eater Rod"
                item.tier = 9
                return (item.tier,item.name)
            }
            if (item.eng! >= 5752 && (item.agi! >= 2301 && item.agi! < 2726)) || ((item.eng! >= 5752 && item.eng! < 6816) && item.agi! >= 2301) {
                item.name = "Storm Blitz Rod"
                item.tier = 10
                return (item.tier,item.name)
            }
            if (item.eng! >= 6816 && (item.agi! >= 2726 && item.agi! < 3184)) || ((item.eng! >= 6816 && item.eng! < 7960) && item.agi! >= 2726) {
                item.name = "Not Available" // TODO: -
                item.tier = 11
                return (item.tier,item.name)
            }
            if (item.eng! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.eng! >= 7960 && item.eng! < 9184) && item.agi! >= 3184) {
                item.name = "Not Available" // TODO: -
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.eng! >= 9184) && (item.agi! >= 3674) {
                item.name = "Not Available" // TODO: -
                item.tier = 13
                return (item.tier,item.name)
            }
        }
        return (nil,nil)
    }
}

class Armor: Items {
    var belongsTo: Classes
    var item = Item()
    
    init(belongsTo: Classes) {
        self.belongsTo = belongsTo
    }
    
    func getItem(str: Point? = nil ?? 0, agi: Point? = nil ?? 0, eng: Point? = nil ?? 0, sta: Point? = nil ?? 0) -> (tier: Int?, name: String?) {
        if str != nil {
            item.str = str!
        }
        if agi != nil {
            item.agi = agi!
        }
        if eng != nil {
            item.eng = eng!
        }
        if sta != nil {
            item.sta = sta!
        }
        
        switch belongsTo {
        case .dk:
            if (item.agi! == 0) && (item.sta! == 0) {
                item.name = "Leather Set"
                item.tier = 1
                return (item.tier, item.name)
            }
            if (item.agi! >= 1 && (item.sta! >= 1 && item.sta! < 192)) || ((item.agi! >= 1 && item.agi! < 128) && item.sta! >= 1) {
                item.name = "Scale Set"
                item.tier = 2
                return (item.tier, item.name)
            }
            if (item.agi! >= 128 && (item.sta! >= 192 && item.sta! < 384)) || ((item.agi! >= 128 && item.agi! < 256) && item.sta! >= 192) {
                item.name = "Brass Set"
                item.tier = 3
                return (item.tier, item.name)
            }
            if (item.agi! >= 256 && (item.sta! >= 384 && item.sta! < 662)) || ((item.agi! >= 256 && item.agi! < 442) && item.sta! >= 384) {
                item.name = "Plate Set"
                item.tier = 4
                return (item.tier, item.name)
            }
            if (item.agi! >= 442 && (item.sta! >= 662 && item.sta! < 1056)) || ((item.agi! >= 442 && item.agi! < 704) && item.sta! >= 662) {
                item.name = "Dragon Set"
                item.tier = 5
                return (item.tier, item.name)
            }
            if (item.agi! >= 704 && (item.sta! >= 1056 && item.sta! < 1594)) || ((item.agi! >= 704 && item.agi! < 1062) && item.sta! >= 1056) {
                item.name = "Black Dragon Set"
                item.tier = 6
                return (item.tier, item.name)
            }
            if (item.agi! >= 1062 && (item.sta! >= 1594 && item.sta! < 2318)) || ((item.agi! >= 1062 && item.agi! < 1546) && item.sta! >= 1594) {
                item.name = "Dark Phoenix set"
                item.tier = 7
                return (item.tier, item.name)
            }
            if (item.agi! >= 1546 && (item.sta! >= 2318 && item.sta! < 2861)) || ((item.agi! >= 1546 && item.agi! < 1907) && item.sta! >= 2318) {
                item.name = "Great Dragon Set"
                item.tier = 8
                return (item.tier, item.name)
            }
            if (item.agi! >= 1907 && (item.sta! >= 2861 && item.sta! < 3451)) || ((item.agi! >= 1907 && item.agi! < 2301) && item.sta! >= 2861) {
                item.name = "Dragon Knight Set"
                item.tier = 9
                return (item.tier, item.name)
            }
            if (item.agi! >= 2301 && (item.sta! >= 3451 && item.sta! < 4090)) || ((item.agi! >= 2301 && item.agi! < 2726) && item.sta! >= 3451) {
                item.name = "Dark Titan Set"
                item.tier = 10
                return (item.tier, item.name)
            }
            if (item.agi! >= 2726 && (item.sta! >= 4090 && item.sta! < 4776)) || ((item.agi! >= 2726 && item.agi! < 3184) && item.sta! >= 4090) {
                item.name = "Chronos Set"
                item.tier = 11
                return (item.tier, item.name)
            }
            if (item.str! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.str! >= 7960 && item.str! < 9184) && item.agi! >= 3184) {
                item.name = "Immortal Set"
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.str! >= 9184) && (item.agi! >= 3674) {
                item.name = "Bloodthirst Set"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .dw:
            if (item.agi! == 0) && (item.sta! == 0) {
                item.name = "Padded Set"
                item.tier = 1
                return (item.tier, item.name)
            }
            if (item.agi! >= 1 && (item.sta! >= 1 && item.sta! < 192)) || ((item.agi! >= 1 && item.agi! < 128) && item.sta! >= 1) {
                item.name = "Bone Set"
                item.tier = 2
                return (item.tier, item.name)
            }
            if (item.agi! >= 128 && (item.sta! >= 192 && item.sta! < 384)) || ((item.agi! >= 128 && item.agi! < 256) && item.sta! >= 192) {
                item.name = "Sphinx Set"
                item.tier = 3
                return (item.tier, item.name)
            }
            if (item.agi! >= 256 && (item.sta! >= 384 && item.sta! < 662)) || ((item.agi! >= 256 && item.agi! < 442) && item.sta! >= 384) {
                item.name = "Moonligh Set"
                item.tier = 4
                return (item.tier, item.name)
            }
            if (item.agi! >= 442 && (item.sta! >= 662 && item.sta! < 1056)) || ((item.agi! >= 442 && item.agi! < 704) && item.sta! >= 662) {
                item.name = "Legendary Set"
                item.tier = 5
                return (item.tier, item.name)
            }
            if (item.agi! >= 704 && (item.sta! >= 1056 && item.sta! < 1594)) || ((item.agi! >= 704 && item.agi! < 1062) && item.sta! >= 1056) {
                item.name = "Eclipse Set"
                item.tier = 6
                return (item.tier, item.name)
            }
            if (item.agi! >= 1062 && (item.sta! >= 1594 && item.sta! < 2318)) || ((item.agi! >= 1062 && item.agi! < 1546) && item.sta! >= 1594) {
                item.name = "Grand Soul set"
                item.tier = 7
                return (item.tier, item.name)
            }
            if (item.agi! >= 1546 && (item.sta! >= 2318 && item.sta! < 2861)) || ((item.agi! >= 1546 && item.agi! < 1907) && item.sta! >= 2318) {
                item.name = "Black Soul Set"
                item.tier = 8
                return (item.tier, item.name)
            }
            if (item.agi! >= 1907 && (item.sta! >= 2861 && item.sta! < 3451)) || ((item.agi! >= 1907 && item.agi! < 2301) && item.sta! >= 2861) {
                item.name = "Venom Mist Set"
                item.tier = 9
                return (item.tier, item.name)
            }
            if (item.agi! >= 2301 && (item.sta! >= 3451 && item.sta! < 4090)) || ((item.agi! >= 2301 && item.agi! < 2726) && item.sta! >= 3451) {
                item.name = "Deathbringer Set"
                item.tier = 10
                return (item.tier, item.name)
            }
            if (item.agi! >= 2726 && (item.sta! >= 4090 && item.sta! < 4776)) || ((item.agi! >= 2726 && item.agi! < 3184) && item.sta! >= 4090) {
                item.name = "Tartaros Set"
                item.tier = 11
                return (item.tier, item.name)
            }
            if (item.eng! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.eng! >= 7960 && item.eng! < 9184) && item.agi! >= 3184) {
                item.name = "Demigod Set"
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.eng! >= 9184) && (item.agi! >= 3674) {
                item.name = "Eternal Set"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .elf:
            if (item.agi! == 0) && (item.sta! == 0) {
                item.name = "Vine Set"
                item.tier = 1
                return (item.tier, item.name)
            }
            if (item.agi! >= 1 && (item.sta! >= 1 && item.sta! < 192)) || ((item.agi! >= 1 && item.agi! < 128) && item.sta! >= 1) {
                item.name = "Silk Set"
                item.tier = 2
                return (item.tier, item.name)
            }
            if (item.agi! >= 128 && (item.sta! >= 192 && item.sta! < 384)) || ((item.agi! >= 128 && item.agi! < 256) && item.sta! >= 192){
                item.name = "Wind Set"
                item.tier = 3
                return (item.tier, item.name)
            }
            if (item.agi! >= 256 && (item.sta! >= 384 && item.sta! < 662)) || ((item.agi! >= 256 && item.agi! < 442) && item.sta! >= 384) {
                item.name = "Spirit Set"
                item.tier = 4
                return (item.tier, item.name)
            }
            if (item.agi! >= 442 && (item.sta! >= 662 && item.sta! < 1056)) || ((item.agi! >= 442 && item.agi! < 704) && item.sta! >= 662) {
                item.name = "Guardian Set"
                item.tier = 5
                return (item.tier, item.name)
            }
            if (item.agi! >= 704 && (item.sta! >= 1056 && item.sta! < 1594)) || ((item.agi! >= 704 && item.agi! < 1062) && item.sta! >= 1056) {
                item.name = "Iris Set"
                item.tier = 6
                return (item.tier, item.name)
            }
            if (item.agi! >= 1062 && (item.sta! >= 1594 && item.sta! < 2318)) || ((item.agi! >= 1062 && item.agi! < 1546) && item.sta! >= 1594) {
                item.name = "Holy Spirit set"
                item.tier = 7
                return (item.tier, item.name)
            }
            if (item.agi! >= 1546 && (item.sta! >= 2318 && item.sta! < 2861)) || ((item.agi! >= 1546 && item.agi! < 1907) && item.sta! >= 2318) {
                item.name = "Red Mist Set"
                item.tier = 8
                return (item.tier, item.name)
            }
            if (item.agi! >= 1907 && (item.sta! >= 2861 && item.sta! < 3451)) || ((item.agi! >= 1907 && item.agi! < 2301) && item.sta! >= 2861) {
                item.name = "Sylphid Set"
                item.tier = 9
                return (item.tier, item.name)
            }
            if (item.agi! >= 2301 && (item.sta! >= 3451 && item.sta! < 4090)) || ((item.agi! >= 2301 && item.agi! < 2726) && item.sta! >= 3451) {
                item.name = "Dreadwind Set"
                item.tier = 10
                return (item.tier, item.name)
            }
            if (item.agi! >= 2726 && (item.sta! >= 4090 && item.sta! < 4776)) || ((item.agi! >= 2726 && item.agi! < 3184) && item.sta! >= 4090) {
                item.name = "Alaeboss Set"
                item.tier = 11
                return (item.tier, item.name)
            }
            if (item.str! >= 7960 && (item.agi! >= 3184 && item.agi! < 3674)) || ((item.str! >= 7960 && item.str! < 9184) && item.agi! >= 3184) {
                item.name = "Valkyrie Set"
                item.tier = 12
                return (item.tier,item.name)
            }
            if (item.str! >= 9184) && (item.agi! >= 3674) {
                item.name = "Raging Gale Set"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .mg:
            if ((item.str! < 220) || (item.eng! < 220)) && (item.agi! < 217) && (item.sta! < 328) {
                item.name = ""
                return (nil,nil)
            }
            if ((item.str! >= 220 || item.eng! >= 220) && (item.agi! >= 217 && item.agi! < 704) && (item.sta! >= 328 && item.sta! < 1056)) || (((item.str! >= 220 && item.str! < 352) || (item.eng! >= 220 && item.eng! < 352)) && item.agi! >= 217 && (item.sta! >= 328 && item.sta! < 1056)) || (((item.str! >= 220 && item.str! < 352) || (item.eng! >= 220 && item.eng! < 352)) && (item.agi! >= 217 && item.agi! < 704) && item.sta! >= 328) || ((item.str! >= 220 || item.eng! >= 220) && item.agi! >= 217 && (item.sta! >= 217 && item.sta! < 1056)) || ((item.str! >= 220 || item.eng! >= 220) && (item.agi! >= 217 && item.agi! < 704) && item.sta! >= 328) {
                item.name = "Atlans Set"
                item.tier = 5
                return (item.tier,item.name)
            }
            if ((item.str! >= 352 || item.eng! >= 352) && (item.agi! >= 704 && item.agi! < 1062) && (item.sta! >= 1056 && item.sta! < 1594)) || (((item.str! >= 352 && item.str! < 531) || (item.eng! >= 352 && item.eng! < 531)) && item.agi! >= 704 && (item.sta! >= 1056 && item.sta! < 1594)) || (((item.str! >= 352 && item.str! < 531) || (item.eng! >= 352 && item.eng! < 531)) && (item.agi! >= 704 && item.agi! < 1062) && item.sta! >= 1056) || ((item.str! >= 352 || item.eng! >= 352) && item.agi! >= 704 && (item.sta! >= 1056 && item.sta! < 1594)) || ((item.str! >= 352 || item.eng! >= 352) && (item.agi! >= 704 && item.agi! < 1062) && item.sta! >= 1056) {
                item.name = "Valiant Set"
                item.tier = 6
                return (item.tier,item.name)
            }
            if ((item.str! >= 531 || item.eng! >= 531) && (item.agi! >= 1062 && item.agi! < 1546) && (item.sta! >= 1594 && item.sta! < 2318)) || (((item.str! >= 531 && item.str! < 772) || (item.eng! >= 531 && item.eng! < 772)) && item.agi! >= 1062 && (item.sta! >= 1594 && item.sta! < 2318)) || (((item.str! >= 531 && item.str! < 772) || (item.eng! >= 531 && item.eng! < 772)) && (item.agi! >= 1062 && item.agi! < 1546) && item.sta! >= 1594) || ((item.str! >= 531 || item.eng! >= 531) && item.agi! >= 1062 && (item.sta! >= 1594 && item.sta! < 2318)) || ((item.str! >= 531 || item.eng! >= 531) && (item.agi! >= 1062 && item.agi! < 1546) && item.sta! >= 1594) {
                item.name = "Thunder Hawk Set"
                item.tier = 7
                return (item.tier,item.name)
            }
            if ((item.str! >= 772 || item.eng! >= 772) && (item.agi! >= 1546 && item.agi! < 1907) && (item.sta! >= 2318 && item.sta! < 2861)) || (((item.str! >= 772 && item.str! < 953) || (item.eng! >= 772 && item.eng! < 953)) && item.agi! >= 1546 && (item.sta! >= 2318 && item.sta! < 2861)) || (((item.str! >= 772 && item.str! < 953) || (item.eng! >= 772 && item.eng! < 953)) && (item.agi! >= 1546 && item.agi! < 1907) && item.sta! >= 2318) || ((item.str! >= 772 || item.eng! >= 772) && item.agi! >= 1546 && (item.sta! >= 2318 && item.sta! < 2861)) || ((item.str! >= 772 || item.eng! >= 772) && (item.agi! >= 1546 && item.agi! < 1907) && item.sta! >= 2318) {
                item.name = "Athril Set"
                item.tier = 8
                return (item.tier,item.name)
            }
            if ((item.str! >= 953 || item.eng! >= 953) && (item.agi! >= 1907 && item.agi! < 2301) && (item.sta! >= 2861 && item.sta! < 3451)) || (((item.str! >= 953 && item.str! < 1150) || (item.eng! >= 953 && item.eng! < 1150)) && item.agi! >= 1907 && (item.sta! >= 2861 && item.sta! < 3451)) || (((item.str! >= 953 && item.str! < 1150) || (item.eng! >= 953 && item.eng! < 1150)) && (item.agi! >= 1907 && item.agi! < 2301) && item.sta! >= 2861) || ((item.str! >= 953 || item.eng! >= 953) && item.agi! >= 1907 && (item.sta! >= 2861 && item.sta! < 3451)) || ((item.str! >= 953 || item.eng! >= 953) && (item.agi! >= 1907 && item.agi! < 2301) && item.sta! >= 2861) {
                item.name = "Magic Knight Set"
                item.tier = 9
                return (item.tier,item.name)
            }
            if ((item.str! >= 1150 || item.eng! >= 1150) && (item.agi! >= 2301 && item.agi! < 2726) && (item.sta! >= 3451 && item.sta! < 4090)) || (((item.str! >= 1150 && item.str! < 1363) || (item.eng! >= 1150 && item.eng! < 1363)) && item.agi! >= 2301 && (item.sta! >= 3451 && item.sta! < 4090)) || (((item.str! >= 1150 && item.str! < 1363) || (item.eng! >= 1150 && item.eng! < 1363)) && (item.agi! >= 2301 && item.agi! < 2726) && item.sta! >= 3451) || ((item.str! >= 1150 || item.eng! >= 1150) && item.agi! >= 2301 && (item.sta! >= 3451 && item.sta! < 4090)) || ((item.str! >= 1150 || item.eng! >= 1150) && (item.agi! >= 2301 && item.agi! < 2726) && item.sta! >= 3451) {
                item.name = "Volcano Set"
                item.tier = 10
                return (item.tier,item.name)
            }
            if ((item.str! >= 1363 || item.eng! >= 1363) && (item.agi! >= 2726 && item.agi! < 3184) && (item.sta! >= 4090 && item.sta! < 4776)) || (((item.str! >= 1363 && item.str! < 1592) || (item.eng! >= 1363 && item.eng! < 1592)) && item.agi! >= 2726 && (item.sta! >= 4090 && item.sta! < 4776)) || (((item.str! >= 1363 && item.str! < 1592) || (item.eng! >= 1363 && item.eng! < 1592)) && (item.agi! >= 2726 && item.agi! < 3184) && item.sta! >= 4090) || ((item.str! >= 1363 || item.eng! >= 1363) && item.agi! >= 2726 && (item.sta! >= 4090 && item.sta! < 4776)) || ((item.str! >= 1363 || item.eng! >= 1363) && (item.agi! >= 2726 && item.agi! < 3184) && item.sta! >= 4776) {
                item.name = "Hell Knight Set"
                item.tier = 11
                return (item.tier,item.name)
            }
            if ((item.str! >= 1592 || item.eng! >= 1592) && (item.agi! >= 3184 && item.agi! < 3674) && (item.sta! >= 4776 && item.sta! < 5510)) || (((item.str! >= 1592 && item.str! < 1837) || (item.eng! >= 1592 && item.eng! < 1837)) && item.agi! >= 3184 && (item.sta! >= 4776 && item.sta! < 5510)) || (((item.str! >= 1592 && item.str! < 1837) || (item.eng! >= 1592 && item.eng! < 1837)) && (item.agi! >= 3184 && item.agi! < 3674) && item.sta! >= 4776) || ((item.str! >= 1592 || item.eng! >= 1592) && item.agi! >= 3184 && (item.sta! >= 4776 && item.sta! < 3184)) || ((item.str! >= 1592 || item.eng! >= 1592) && (item.agi! >= 3184 && item.agi! < 3674) && item.sta! >= 4776) {
                item.name = "Berus Set"
                item.tier = 12
                return (item.tier,item.name)
            }
            if ((item.str! >= 1837) || (item.eng! >= 1837)) && (item.agi! >= 3674) && (item.sta! >= 5510) {
                item.name = "Infinite Set"
                item.tier = 13
                return (item.tier,item.name)
            }
        case .sum:
            if (item.eng! < 220) && (item.agi! < 217) && (item.sta! < 328) {
                item.name = ""
                return (nil,nil)
            }
            if (item.agi! >= 217 && item.eng! >= 220 && (item.sta! >= 328 && item.sta! < 1056)) || ((item.agi! >= 217 && item.agi! < 704) && item.eng! >= 220 && item.sta! >= 328) || (item.agi! >= 217 && (item.eng! >= 220 && item.eng! < 352) && (item.sta! >= 328 && item.sta! < 1056)) {
                item.name = "Zephyrus Set"
                item.tier = 5
                return (item.tier, item.name)
            }
            if (item.agi! >= 704 && (item.eng! >= 352 && item.eng! < 531) && item.sta! >= 1056) || ((item.agi! >= 704 && item.agi! < 1062) && item.eng! >= 352 && item.sta! >= 1056) || (item.agi! >= 704 && item.eng! >= 352 && (item.sta! >= 1056 && item.sta! < 1594)) {
                item.name = "Red Wing Set"
                item.tier = 6
                return (item.tier, item.name)
            }
            if (item.agi! >= 1062 && (item.eng! >= 531 && item.eng! < 772) && item.sta! >= 1594) || ((item.agi! >= 1062 && item.agi! < 1546) && item.eng! >= 531 && item.sta! >= 1594) || (item.agi! >= 1062 && item.eng! >= 531 && (item.sta! >= 1594 && item.sta! < 2318)) {
                item.name = "Ancient Set"
                item.tier = 7
                return (item.tier, item.name)
            }
            if (item.agi! >= 1546 && (item.eng! >= 772 && item.eng! < 953) && item.sta! >= 2318) || ((item.agi! >= 1546 && item.agi! < 1907) && item.eng! >= 772 && item.sta! >= 2318) || (item.agi! >= 1546 && item.eng! >= 772 && (item.sta! >= 2318 && item.sta! < 2861)) {
                item.name = "Eternal Set"
                item.tier = 8
                return (item.tier, item.name)
            }
            if (item.agi! >= 1907 && (item.eng! >= 953 && item.eng! < 1150) && item.sta! >= 2861) || ((item.agi! >= 1907 && item.agi! < 2301) && item.eng! >= 953 && item.sta! >= 2861) || (item.agi! >= 1907 && item.eng! >= 953 && (item.sta! >= 2861 && item.sta! < 3451)) {
                item.name = "Dream Eater Set"
                item.tier = 9
                return (item.tier, item.name)
            }
            if (item.agi! >= 2301 && (item.eng! >= 1150 && item.eng! < 1363) && item.sta! >= 3451) || ((item.agi! >= 2301 && item.agi! < 2726) && item.eng! >= 1150 && item.sta! >= 3451) || (item.agi! >= 2301 && item.eng! >= 1150 && (item.sta! >= 3451 && item.sta! < 4090)) {
                item.name = "Storm Blitz Set"
                item.tier = 10
                return (item.tier, item.name)
            }
            if (item.agi! >= 2726 && (item.eng! >= 1363 && item.eng! < 1592) && item.sta! >= 4090) || ((item.agi! >= 2726 && item.agi! < 3184) && item.eng! >= 1363 && item.sta! >= 4090) || (item.agi! >= 2726 && item.eng! >= 1363 && (item.sta! >= 4090 && item.sta! < 4776)) {
                item.name = "Not Available" // TODO: -
                item.tier = 11
                return (item.tier, item.name)
            }
            if (item.agi! >= 3184 && (item.eng! >= 1592 && item.eng! < 1837) && item.sta! >= 4776) || ((item.agi! >= 3184 && item.agi! < 3674) && item.eng! >= 1592 && item.sta! >= 4776) || (item.agi! >= 3184 && item.eng! >= 1592 && (item.sta! >= 4776 && item.sta! < 5510)) {
                item.name = "Not Available" // TODO: -
                item.tier = 12
                return (item.tier, item.name)
            }
            if (item.agi! >= 3674) && (item.eng! >= 1837) && (item.sta! >= 5510) {
                item.name = "Not Available" // TODO: -
                item.tier = 13
                return (item.tier, item.name)
            }
        }
        return (nil,nil)
    }
}
