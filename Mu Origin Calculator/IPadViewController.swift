//
//  IPadViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 12/14/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class IPadViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var leftContainer: UIView!
    @IBOutlet weak var rightContainer: UIView!
    @IBOutlet weak var darkWizardContainer: UIView!
    @IBOutlet weak var elfContainer: UIView!
    @IBOutlet weak var magicKnightContainer: UIView!
    @IBOutlet weak var summonerContainer: UIView!
    @IBOutlet weak var extraMenuContainer: UIView!
    
    // MARK: - Variables
    fileprivate weak var mainMenuVC: MainMenuViewController?
    fileprivate weak var darkKnightVC: DarkKnightViewController?
    fileprivate weak var darkWizardVC: DarkWizardViewController?
    fileprivate weak var elfVC: ElfViewController?
    fileprivate weak var magicKnightVC: MagicKnightViewController?
    fileprivate weak var summonerVC: SummonerViewController?
    fileprivate weak var extraMenuVC: ExtraStatsViewController?
    fileprivate var index: Int?
    fileprivate var navigationControllerForCharacters: UINavigationController?
    var delegateDK : SaveDataDelegate?
    var delegateDW : SaveDataDelegate?
    var delegateELF : SaveDataDelegate?
    var delegateMG : SaveDataDelegate?
    var delegameSumm: SaveDataDelegate?
    var extraStatsDelegate: SaveDataDelegate?
  
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        navigationController?.navigationBar.tintColor = .orange
        rightContainer.isHidden = true
        darkWizardContainer.isHidden = true
        elfContainer.isHidden = true
        magicKnightContainer.isHidden = true
        summonerContainer.isHidden = true
        extraMenuContainer.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegateDK?.saveData(false, clas: Classes.dk)
        delegateDW?.saveData(false, clas: Classes.dw)
        delegateELF?.saveData(false, clas: Classes.elf)
        delegateMG?.saveData(false, clas: Classes.mg)
        delegameSumm?.saveData(false, clas: Classes.sum)
        extraStatsDelegate?.saveData(false, clas: .extra)
    }
    
    // MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menusForIpad" {
            if let navigationController = segue.destination as? UINavigationController {
                mainMenuVC = navigationController.viewControllers.first as? MainMenuViewController
                mainMenuVC?.delegate = self
                mainMenuVC?.view.backgroundColor = backgroundColor.withAlphaComponent(0.1)
            }
        } else if segue.identifier == "DarkKnightIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                darkKnightVC = navigationController.viewControllers.first as? DarkKnightViewController
                darkKnightVC?.subject = Classes.dk.rawValue
                darkKnightVC?.iPadViewController = self
            }
        } else if segue.identifier == "DarkWizardIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                darkWizardVC = navigationController.viewControllers.first as? DarkWizardViewController
                darkWizardVC?.subject = Classes.dw.rawValue
                darkWizardVC?.iPadViewController = self
            }
        } else if segue.identifier == "ElfIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                elfVC = navigationController.viewControllers.first as? ElfViewController
                elfVC?.subject = Classes.elf.rawValue
                elfVC?.iPadViewController = self
            }
        } else if segue.identifier == "MagicKnightIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                magicKnightVC = navigationController.viewControllers.first as? MagicKnightViewController
                magicKnightVC?.subject = Classes.mg.rawValue
                magicKnightVC?.iPadViewController = self
            }
        } else if segue.identifier == "SummonerIPad" {
            if let navigationController = segue.destination as? UINavigationController {
                summonerVC = navigationController.viewControllers.first as? SummonerViewController
                summonerVC?.subject = Classes.sum.rawValue
                summonerVC?.iPadViewController = self
            }
        } else if segue.identifier == "ExtraStatsiPad" {
            if let navigationController = segue.destination as? UINavigationController {
                extraMenuVC = navigationController.viewControllers.first as? ExtraStatsViewController
                extraMenuVC?.subject = Classes.extra.rawValue
                extraMenuVC?.iPadViewController = self
            }
        }
    }
}

extension IPadViewController: MenuViewControllerDelegate {
  /**
   Protocol which indetifies which classes is selected.
   
   - Parameter index: index of selected class.
   
   */
  func segue(_ index: Classes) {
    switch index {
    case .dk:
        rightContainer.isHidden = false
        darkWizardContainer.isHidden = true
        elfContainer.isHidden = true
        magicKnightContainer.isHidden = true
        summonerContainer.isHidden = true
        extraMenuContainer.isHidden = true
        navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
        
        darkKnightVC?.view.endEditing(true)
        darkWizardVC?.view.endEditing(true)
        elfVC?.view.endEditing(true)
        magicKnightVC?.view.endEditing(true)
        extraMenuVC?.view.endEditing(true)
        
        mainMenuVC?.darkKnightButton.isSelected = true
        mainMenuVC?.darkWizardButton.isSelected = false
        mainMenuVC?.elfButton.isSelected = false
        mainMenuVC?.magicKnightButton.isSelected = false
        mainMenuVC?.summonerButton.isSelected = false
        mainMenuVC?.AdditionalCalculationButton.isSelected = false
        
        delegateDK?.saveData(true, clas: Classes.dk)
    case .dw:
        rightContainer.isHidden = true
        darkWizardContainer.isHidden = false
        elfContainer.isHidden = true
        magicKnightContainer.isHidden = true
        summonerContainer.isHidden = true
        extraMenuContainer.isHidden = true
        navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
        
        darkKnightVC?.view.endEditing(true)
        darkWizardVC?.view.endEditing(true)
        elfVC?.view.endEditing(true)
        magicKnightVC?.view.endEditing(true)
        extraMenuVC?.view.endEditing(true)
        
        mainMenuVC?.darkKnightButton.isSelected = false
        mainMenuVC?.darkWizardButton.isSelected = true
        mainMenuVC?.elfButton.isSelected = false
        mainMenuVC?.magicKnightButton.isSelected = false
        mainMenuVC?.summonerButton.isSelected = false
        mainMenuVC?.AdditionalCalculationButton.isSelected = false
        
        delegateDW?.saveData(true, clas: Classes.dw)
    case .elf:
        rightContainer.isHidden = true
        darkWizardContainer.isHidden = true
        elfContainer.isHidden = false
        magicKnightContainer.isHidden = true
        summonerContainer.isHidden = true
        extraMenuContainer.isHidden = true
        navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
        
        darkKnightVC?.view.endEditing(true)
        darkWizardVC?.view.endEditing(true)
        elfVC?.view.endEditing(true)
        magicKnightVC?.view.endEditing(true)
        extraMenuVC?.view.endEditing(true)
        
        mainMenuVC?.darkKnightButton.isSelected = false
        mainMenuVC?.darkWizardButton.isSelected = false
        mainMenuVC?.elfButton.isSelected = true
        mainMenuVC?.magicKnightButton.isSelected = false
        mainMenuVC?.summonerButton.isSelected = false
        mainMenuVC?.AdditionalCalculationButton.isSelected = false
        
        delegateELF?.saveData(true, clas: Classes.elf)
    case .mg:
        rightContainer.isHidden = true
        darkWizardContainer.isHidden = true
        elfContainer.isHidden = true
        magicKnightContainer.isHidden = false
        summonerContainer.isHidden = true
        extraMenuContainer.isHidden = true
        navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
        
        darkKnightVC?.view.endEditing(true)
        darkWizardVC?.view.endEditing(true)
        elfVC?.view.endEditing(true)
        magicKnightVC?.view.endEditing(true)
        extraMenuVC?.view.endEditing(true)
        
        mainMenuVC?.darkKnightButton.isSelected = false
        mainMenuVC?.darkWizardButton.isSelected = false
        mainMenuVC?.elfButton.isSelected = false
        mainMenuVC?.magicKnightButton.isSelected = true
        mainMenuVC?.summonerButton.isSelected = false
        mainMenuVC?.AdditionalCalculationButton.isSelected = false
        
        delegateMG?.saveData(true, clas: Classes.mg)
    case .sum:
        rightContainer.isHidden = true
        darkWizardContainer.isHidden = true
        elfContainer.isHidden = true
        magicKnightContainer.isHidden = true
        summonerContainer.isHidden = false
        extraMenuContainer.isHidden = true
        navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
        
        darkKnightVC?.view.endEditing(true)
        darkWizardVC?.view.endEditing(true)
        elfVC?.view.endEditing(true)
        magicKnightVC?.view.endEditing(true)
        extraMenuVC?.view.endEditing(true)
        
        mainMenuVC?.darkKnightButton.isSelected = false
        mainMenuVC?.darkWizardButton.isSelected = false
        mainMenuVC?.elfButton.isSelected = false
        mainMenuVC?.magicKnightButton.isSelected = false
        mainMenuVC?.summonerButton.isSelected = true
        mainMenuVC?.AdditionalCalculationButton.isSelected = false
        
        delegameSumm?.saveData(true, clas: Classes.sum)
    case .extra:
        rightContainer.isHidden = true
        darkWizardContainer.isHidden = true
        elfContainer.isHidden = true
        magicKnightContainer.isHidden = true
        summonerContainer.isHidden = true
        extraMenuContainer.isHidden = false
        navigationControllerForCharacters?.viewControllers.first?.resignFirstResponder()
        
        darkKnightVC?.view.endEditing(true)
        darkWizardVC?.view.endEditing(true)
        elfVC?.view.endEditing(true)
        magicKnightVC?.view.endEditing(true)
        summonerVC?.view.endEditing(true)
        
        mainMenuVC?.darkKnightButton.isSelected = false
        mainMenuVC?.darkWizardButton.isSelected = false
        mainMenuVC?.elfButton.isSelected = false
        mainMenuVC?.magicKnightButton.isSelected = false
        mainMenuVC?.summonerButton.isSelected = false
        mainMenuVC?.AdditionalCalculationButton.isSelected = true
        
        extraStatsDelegate?.saveData(true, clas: .extra)
    }
  }
}
