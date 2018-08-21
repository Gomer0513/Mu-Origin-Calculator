//
//  IPadViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 12/14/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class IPadViewController: UIViewController, MenuViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var leftContainer: UIView!
    @IBOutlet weak var rightContainer: UIView!
    @IBOutlet weak var darkWizardContainer: UIView!
    @IBOutlet weak var elfContainer: UIView!
    @IBOutlet weak var magicKnightContainer: UIView!
    @IBOutlet weak var summonerContainer: UIView!
    @IBOutlet weak var extraMenuContainer: UIView!
    
    // MARK: - Variables
    private weak var mainMenuVC: MainMenuViewController?
    private weak var darkKnightVC: DarkKnightViewController?
    private weak var darkWizardVC: DarkWizardViewController?
    private weak var elfVC: ElfViewController?
    private weak var magicKnightVC: MagicKnightViewController?
    private weak var summonerVC: SummonerViewController?
    private weak var extraMenuVC: ExtraStatsViewController?
    private var index: Int?
    private var navigationControllerForCharacters: UINavigationController?
    var delegateDK : saveDataDelegate?
    var delegateDW : saveDataDelegate?
    var delegateELF : saveDataDelegate?
    var delegateMG : saveDataDelegate?
    var delegameSumm: saveDataDelegate?
    var extraStatsDelegate: saveDataDelegate?
    
    // MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        self.navigationController?.navigationBar.tintColor = .orange
        self.rightContainer.isHidden = true
        self.darkWizardContainer.isHidden = true
        self.elfContainer.isHidden = true
        self.magicKnightContainer.isHidden = true
        self.summonerContainer.isHidden = true
        self.extraMenuContainer.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegateDK?.saveData(false, clas: Classes.dk)
        self.delegateDW?.saveData(false, clas: Classes.dw)
        self.delegateELF?.saveData(false, clas: Classes.elf)
        self.delegateMG?.saveData(false, clas: Classes.mg)
        self.delegameSumm?.saveData(false, clas: Classes.sum)
        self.extraStatsDelegate?.saveData(false, clas: .extra)
    }
    
    /**
     Protocol which indetifies which classes is selected.
     
     - Parameter index: index of selected class.
     
     */
    func segue(_ index: Classes) {
        
        switch index {
        case .dk:
            self.rightContainer.isHidden = false
            self.darkWizardContainer.isHidden = true
            self.elfContainer.isHidden = true
            self.magicKnightContainer.isHidden = true
            self.summonerContainer.isHidden = true
            self.extraMenuContainer.isHidden = true
            self.navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
            
            self.darkKnightVC?.view.endEditing(true)
            self.darkWizardVC?.view.endEditing(true)
            self.elfVC?.view.endEditing(true)
            self.magicKnightVC?.view.endEditing(true)
            self.extraMenuVC?.view.endEditing(true)
            
            self.mainMenuVC?.darkKnightButton.isSelected = true
            self.mainMenuVC?.darkWizardButton.isSelected = false
            self.mainMenuVC?.elfButton.isSelected = false
            self.mainMenuVC?.magicKnightButton.isSelected = false
            self.mainMenuVC?.summonerButton.isSelected = false
            self.mainMenuVC?.AdditionalCalculationButton.isSelected = false
            
            self.delegateDK?.saveData(true, clas: Classes.dk)
        case .dw:
            self.rightContainer.isHidden = true
            self.darkWizardContainer.isHidden = false
            self.elfContainer.isHidden = true
            self.magicKnightContainer.isHidden = true
            self.summonerContainer.isHidden = true
            self.extraMenuContainer.isHidden = true
            self.navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
            
            self.darkKnightVC?.view.endEditing(true)
            self.darkWizardVC?.view.endEditing(true)
            self.elfVC?.view.endEditing(true)
            self.magicKnightVC?.view.endEditing(true)
            self.extraMenuVC?.view.endEditing(true)
            
            self.mainMenuVC?.darkKnightButton.isSelected = false
            self.mainMenuVC?.darkWizardButton.isSelected = true
            self.mainMenuVC?.elfButton.isSelected = false
            self.mainMenuVC?.magicKnightButton.isSelected = false
            self.mainMenuVC?.summonerButton.isSelected = false
            self.mainMenuVC?.AdditionalCalculationButton.isSelected = false
            
            self.delegateDW?.saveData(true, clas: Classes.dw)
        case .elf:
            self.rightContainer.isHidden = true
            self.darkWizardContainer.isHidden = true
            self.elfContainer.isHidden = false
            self.magicKnightContainer.isHidden = true
            self.summonerContainer.isHidden = true
            self.extraMenuContainer.isHidden = true
            self.navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
            
            self.darkKnightVC?.view.endEditing(true)
            self.darkWizardVC?.view.endEditing(true)
            self.elfVC?.view.endEditing(true)
            self.magicKnightVC?.view.endEditing(true)
            self.extraMenuVC?.view.endEditing(true)
            
            self.mainMenuVC?.darkKnightButton.isSelected = false
            self.mainMenuVC?.darkWizardButton.isSelected = false
            self.mainMenuVC?.elfButton.isSelected = true
            self.mainMenuVC?.magicKnightButton.isSelected = false
            self.mainMenuVC?.summonerButton.isSelected = false
            self.mainMenuVC?.AdditionalCalculationButton.isSelected = false
            
            self.delegateELF?.saveData(true, clas: Classes.elf)
        case .mg:
            self.rightContainer.isHidden = true
            self.darkWizardContainer.isHidden = true
            self.elfContainer.isHidden = true
            self.magicKnightContainer.isHidden = false
            self.summonerContainer.isHidden = true
            self.extraMenuContainer.isHidden = true
            self.navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
            
            self.darkKnightVC?.view.endEditing(true)
            self.darkWizardVC?.view.endEditing(true)
            self.elfVC?.view.endEditing(true)
            self.magicKnightVC?.view.endEditing(true)
            self.extraMenuVC?.view.endEditing(true)
            
            self.mainMenuVC?.darkKnightButton.isSelected = false
            self.mainMenuVC?.darkWizardButton.isSelected = false
            self.mainMenuVC?.elfButton.isSelected = false
            self.mainMenuVC?.magicKnightButton.isSelected = true
            self.mainMenuVC?.summonerButton.isSelected = false
            self.mainMenuVC?.AdditionalCalculationButton.isSelected = false
            
            self.delegateMG?.saveData(true, clas: Classes.mg)
        case .sum:
            self.rightContainer.isHidden = true
            self.darkWizardContainer.isHidden = true
            self.elfContainer.isHidden = true
            self.magicKnightContainer.isHidden = true
            self.summonerContainer.isHidden = false
            self.extraMenuContainer.isHidden = true
            self.navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
            
            self.darkKnightVC?.view.endEditing(true)
            self.darkWizardVC?.view.endEditing(true)
            self.elfVC?.view.endEditing(true)
            self.magicKnightVC?.view.endEditing(true)
            self.extraMenuVC?.view.endEditing(true)
            
            self.mainMenuVC?.darkKnightButton.isSelected = false
            self.mainMenuVC?.darkWizardButton.isSelected = false
            self.mainMenuVC?.elfButton.isSelected = false
            self.mainMenuVC?.magicKnightButton.isSelected = false
            self.mainMenuVC?.summonerButton.isSelected = true
            self.mainMenuVC?.AdditionalCalculationButton.isSelected = false
            
            self.delegameSumm?.saveData(true, clas: Classes.sum)
        case .extra:
            self.rightContainer.isHidden = true
            self.darkWizardContainer.isHidden = true
            self.elfContainer.isHidden = true
            self.magicKnightContainer.isHidden = true
            self.summonerContainer.isHidden = true
            self.extraMenuContainer.isHidden = false
            self.navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
            
            self.darkKnightVC?.view.endEditing(true)
            self.darkWizardVC?.view.endEditing(true)
            self.elfVC?.view.endEditing(true)
            self.magicKnightVC?.view.endEditing(true)
            self.summonerVC?.view.endEditing(true)
            
            self.mainMenuVC?.darkKnightButton.isSelected = false
            self.mainMenuVC?.darkWizardButton.isSelected = false
            self.mainMenuVC?.elfButton.isSelected = false
            self.mainMenuVC?.magicKnightButton.isSelected = false
            self.mainMenuVC?.summonerButton.isSelected = false
            self.mainMenuVC?.AdditionalCalculationButton.isSelected = true
            
            self.extraStatsDelegate?.saveData(true, clas: .extra)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menusForIpad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.mainMenuVC = navigationController.viewControllers.first as? MainMenuViewController
                self.mainMenuVC?.delegate = self
                self.mainMenuVC?.view.backgroundColor = backgroundColor.withAlphaComponent(0.1)
            }
        } else if segue.identifier == "DarkKnightIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.darkKnightVC = navigationController.viewControllers.first as? DarkKnightViewController
                self.darkKnightVC?.subject = Classes.dk.rawValue
                self.darkKnightVC?.iPadViewController = self
            }
        } else if segue.identifier == "DarkWizardIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.darkWizardVC = navigationController.viewControllers.first as? DarkWizardViewController
                self.darkWizardVC?.subject = Classes.dw.rawValue
                self.darkWizardVC?.iPadViewController = self
            }
        } else if segue.identifier == "ElfIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.elfVC = navigationController.viewControllers.first as? ElfViewController
                self.elfVC?.subject = Classes.elf.rawValue
                self.elfVC?.iPadViewController = self
            }
        } else if segue.identifier == "MagicKnightIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.magicKnightVC = navigationController.viewControllers.first as? MagicKnightViewController
                self.magicKnightVC?.subject = Classes.mg.rawValue
                self.magicKnightVC?.iPadViewController = self
            }
        } else if segue.identifier == "SummonerIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.summonerVC = navigationController.viewControllers.first as? SummonerViewController
                self.summonerVC?.subject = Classes.sum.rawValue
                self.summonerVC?.iPadViewController = self
            }
        } else if segue.identifier == "ExtraStatsiPad" {
            if let navigationController = segue.destination as? UINavigationController {
                self.extraMenuVC = navigationController.viewControllers.first as? ExtraStatsViewController
                self.extraMenuVC?.subject = Classes.extra.rawValue
                self.extraMenuVC?.iPadViewController = self
            }
        }
    }
}

protocol saveDataDelegate {
    func saveData(_ isActive: Bool, clas: Classes)
}
