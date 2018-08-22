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
    
    // MARK: - Constants
    internal let alert = Alert.sharedInstance
    
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
    
    func performSegueForExtraButton(_ sender: Any) {
        if UIDevice.current.userInterfaceIdiom == .phone{
            performSegue(withIdentifier: "ExtraStats", sender: self)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.delegate?.segue(.extra)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
        self.requestProductInfo()
        
        if nonConsumablePurchaseMade {
            self.AdditionalCalculationButton.setTitleColor(.white, for: .normal)
            self.AdditionalCalculationButton.addTarget(self, action: #selector(performSegueForExtraButton), for: .touchUpInside)
        } else {
            self.AdditionalCalculationButton.setTitleColor(.orange, for: .normal)
            self.AdditionalCalculationButton.addTarget(self, action: #selector(makePurchase), for: .touchUpInside)
        }
    }

    private func initialSetup() {
        self.mainMenuView.isUserInteractionEnabled = false
        self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.55)
        self.mainMenuView.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
        self.chooseCharacterLabel.textColor = UIColor.orange
        self.chooseCharacterLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 35.0)
        
        self.darkKnightButton.setTitle(Classes.dk.rawValue, for: .normal)
        self.darkWizardButton.setTitle(Classes.dw.rawValue, for: .normal)
        self.elfButton.setTitle(Classes.elf.rawValue, for: .normal)
        self.magicKnightButton.setTitle(Classes.mg.rawValue, for: .normal)
        self.summonerButton.setTitle(Classes.sum.rawValue, for: .normal)
        self.AdditionalCalculationButton.setTitle("Extra Calculation", for: .normal)
        self.AdditionalCalculationButton.isEnabled = true
    }
    
    func makePurchase(sender: UIButton) {
        purchaseMyProduct(product: self.product)
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

extension MainMenuViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.mainMenuView.isUserInteractionEnabled = true
        if response.products.count != 0 {
            for product in response.products {
                self.product = product
            }
        } else {
            print("there are no products!")
        }
        
        if response.invalidProductIdentifiers.count != 0 {
            print(response.invalidProductIdentifiers.description)
        }
    }
    
    internal func requestProductInfo() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifier = NSSet(object: productID)
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifier as! Set<String>)
            
            productRequest.delegate = self
            productRequest.start()
        }
        else {
            alert.errorAlert(title: "Error", message: "Cannot perform In App Purchases.", viewController: self)
        }
    }
    
    internal func purchaseMyProduct(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
            print("PRODUCT TO PURCHASE: \(product.productIdentifier)")
            
        } else {
            alert.errorAlert(title: "Error", message: "Purchases are not supported by this device.", viewController: self)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction:AnyObject in transactions {
            if let trans = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                    
                case .purchased:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    
                    nonConsumablePurchaseMade = true
                    UserDefaults.standard.set(nonConsumablePurchaseMade, forKey: "Purchase")
                    
                    self.AdditionalCalculationButton.removeTarget(self, action: #selector(makePurchase), for: .touchUpInside)
                    
                    self.AdditionalCalculationButton.setTitleColor(.white, for: .normal)
                    self.AdditionalCalculationButton.addTarget(self, action: #selector(performSegueForExtraButton), for: .touchUpInside)
                    
                    break
                case .failed:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                case .restored:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                    
                default: break
                }
            }
        }
    }
}

protocol MenuViewControllerDelegate {
    func segue(_ index: Classes)
}
