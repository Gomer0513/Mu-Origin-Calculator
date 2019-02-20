//
//  MainMenuViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/13/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit
import StoreKit

class MainMenuViewController: UIViewController {
  
    // MARK: - Outlets
    @IBOutlet weak var mainMenuView: UIView!
    @IBOutlet weak var chooseCharacterLabel: UILabel!
    @IBOutlet weak var darkKnightButton: UIButton!
    @IBOutlet weak var darkWizardButton: UIButton!
    @IBOutlet weak var elfButton: UIButton!
    @IBOutlet weak var magicKnightButton: UIButton!
    @IBOutlet weak var summonerButton: UIButton!
    @IBOutlet weak var AdditionalCalculationButton: UIButton!
    
    // MARK: - Variables
    var delegate: MenuViewControllerDelegate?
    internal var nonConsumablePurchaseMade = UserDefaults.standard.bool(forKey: "Purchase")
    internal var product: SKProduct!
    var restoreButton: UIBarButtonItem {
        let button = UIBarButtonItem()
        button.tintColor = UIColor.orange
        button.title = "Restore"
        button.target = self
        button.action = #selector(restorePurchases(_:))
        return button
    }
  
    // MARK: - Constants
    internal let alert = Alert.sharedInstance
    private let iapHelper = IAPHelper.singletonHelper
    
    // MARK: - IBAction
    @IBAction func darkKnightButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "DarkKinght", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.segue(.dk)
        }
    }
    
    @IBAction func darkWizardButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "DarkWizard", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.segue(.dw)
        }
    }
    
    @IBAction func elfButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "Elf", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.segue(.elf)
        }
    }
    
    @IBAction func magicKnightButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "MagicKnight", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.segue(.mg)
        }
    }
    
    @IBAction func summonerButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "Summoner", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.segue(.sum)
        }
    }
    
    func performSegueForExtraButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "ExtraStats", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.segue(.extra)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
        if nonConsumablePurchaseMade {
            AdditionalCalculationButton.setTitleColor(.white, for: .normal)
            AdditionalCalculationButton.addTarget(self, action: #selector(performSegueForExtraButton), for: .touchUpInside)
        } else {
            AdditionalCalculationButton.setTitleColor(.orange, for: .normal)
            AdditionalCalculationButton.addTarget(self, action: #selector(requestPurchase), for: .touchUpInside)
        }
    }

    // MARK: - Methods
    
    private func initialSetup() {
        navigationItem.rightBarButtonItem = restoreButton
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.55)
        mainMenuView.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
        chooseCharacterLabel.textColor = UIColor.orange
        chooseCharacterLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 35.0)
        
        darkKnightButton.setTitle(Classes.dk.rawValue, for: .normal)
        darkWizardButton.setTitle(Classes.dw.rawValue, for: .normal)
        elfButton.setTitle(Classes.elf.rawValue, for: .normal)
        magicKnightButton.setTitle(Classes.mg.rawValue, for: .normal)
        summonerButton.setTitle(Classes.sum.rawValue, for: .normal)
        AdditionalCalculationButton.setTitle("Extra Calculation", for: .normal)
        
        view.isUserInteractionEnabled = true
        navigationController?.navigationBar.isUserInteractionEnabled = true
    }
    
    func requestPurchase(sender: UIButton) {
        iapHelper.requestProductInfo()
        iapHelper.delegate = self
        view.isUserInteractionEnabled = false
        navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    func restorePurchases(_ sender: Any) {
        iapHelper.restoreProducts()
        iapHelper.delegate = self
        view.isUserInteractionEnabled = false
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
        
        if segue.identifier == "ExtraStats" {
            if let vc = segue.destination as? ExtraStatsViewController {
                vc.subject = "Extra Stats"
            }
        }
    }
}

extension MainMenuViewController: IAPHelperDelegate {
    func sendInformation(message: String, success: Bool) {
        if success == true {
            alert.errorAlert(title: "Success", message: message, viewController: self)
        } else {
            alert.errorAlert(title: "Error", message: message, viewController: self)
        }
    }
    
    func isPaymentSuccessful(_ success: Bool) {
        if success == true {
            UserDefaults.standard.set(true, forKey: "Purchase")
            AdditionalCalculationButton.setTitleColor(.white, for: .normal)
            AdditionalCalculationButton.removeTarget(nil, action: nil, for: .allEvents)
            AdditionalCalculationButton.addTarget(self, action: #selector(performSegueForExtraButton), for: .touchUpInside)
            view.isUserInteractionEnabled = true
            navigationController?.navigationBar.isUserInteractionEnabled = true
        } else {
            UserDefaults.standard.set(false, forKey: "Purchase")
            AdditionalCalculationButton.setTitleColor(.orange, for: .normal)
            AdditionalCalculationButton.removeTarget(nil, action: nil, for: .allEvents)
            AdditionalCalculationButton.addTarget(self, action: #selector(requestPurchase), for: .touchUpInside)
            view.isUserInteractionEnabled = true
            navigationController?.navigationBar.isUserInteractionEnabled = true
        }
    }
}
