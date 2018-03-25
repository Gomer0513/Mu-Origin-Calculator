//
//  MainMenuViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/13/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
  
    // MARK: - Outlets
    @IBOutlet weak var mainMenuView: UIView!
    @IBOutlet weak var chooseCharacterLabel: UILabel!
    @IBOutlet weak var darkKnightButton: UIButton!
    @IBOutlet weak var darkWizardButton: UIButton!
    @IBOutlet weak var elfButton: UIButton!
    @IBOutlet weak var magicKnightButton: UIButton!
    @IBOutlet weak var summonerButton: UIButton!
    
    var delegate: MenuViewControllerDelegate?
    
    @IBAction func darkKnightButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "DarkKinght", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.delegate?.segue(.dk)
        }
    }
    @IBAction func darkWizardButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "DarkWizard", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.delegate?.segue(.dw)
        }
    }
    @IBAction func elfButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "Elf", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.delegate?.segue(.elf)
        }
    }
    @IBAction func magicKnightButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "MagicKnight", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.delegate?.segue(.mg)
        }
    }
    @IBAction func summonerButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "Summoner", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.delegate?.segue(.sum)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
    }

    private func initialSetup() {
        self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.55)
        self.mainMenuView.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
        self.chooseCharacterLabel.textColor = UIColor.orange
        self.chooseCharacterLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 35.0)
        
        self.darkKnightButton.setTitle(Classes.dk.rawValue, for: .normal)
        self.darkWizardButton.setTitle(Classes.dw.rawValue, for: .normal)
        self.elfButton.setTitle(Classes.elf.rawValue, for: .normal)
        self.magicKnightButton.setTitle(Classes.mg.rawValue, for: .normal)
        self.summonerButton.setTitle(Classes.sum.rawValue, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DarkKinght" {
            if let vc = segue.destination as? DarkKnightViewController {
                vc.subject = Classes.dk.rawValue
            }
        }
        
        if segue.identifier == "DarkWizard" {
            if let vc = segue.destination as? DarkWizardViewController {
                vc.subject = Classes.dw.rawValue
            }
        }
        
        if segue.identifier == "Elf" {
            if let vc = segue.destination as? ElfViewController {
                vc.subject = Classes.elf.rawValue
            }
        }
        
        if segue.identifier == "MagicKnight" {
            if let vc = segue.destination as? MagicKnightViewController {
                vc.subject = Classes.mg.rawValue
            }
        }
        
        if segue.identifier == "Summoner" {
            if let vc = segue.destination as? SummonerViewController {
                vc.subject = Classes.sum.rawValue
            }
        }
    }
}

protocol MenuViewControllerDelegate {
    func segue(_ index: Classes)
}
