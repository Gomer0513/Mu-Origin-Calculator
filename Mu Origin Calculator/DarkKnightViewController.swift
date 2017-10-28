//
//  DarkKnightViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/11/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class DarkKnightViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var inputTitleLabel: LabelWhiteColorClass!
    @IBOutlet weak var rebirthInputLabel: LabelWhiteColorClass!
    @IBOutlet weak var currentLevelLabel: LabelWhiteColorClass!
    @IBOutlet weak var creatonInputLabel: LabelWhiteColorClass!
    
    @IBOutlet weak var rebirthInput: UITextField!
    @IBOutlet weak var levelInput: UITextField!
    @IBOutlet weak var fruitStatsInput: UITextField!
    
    @IBOutlet weak var strLabel: LabelWhiteColorClass!
    @IBOutlet weak var agiLabel: LabelWhiteColorClass!
    @IBOutlet weak var staLabel: LabelWhiteColorClass!
    
    @IBOutlet weak var strField: UITextField!
    @IBOutlet weak var agiField: UITextField!
    @IBOutlet weak var staField: UITextField!
    
    @IBOutlet weak var totalStats: UILabel!
    @IBOutlet weak var statsWithoutCreatons: UILabel!
    @IBOutlet weak var totalStatsLabel: LabelWhiteColorClass!
    @IBOutlet weak var statsWithoutCreatonsLabel: LabelWhiteColorClass!
    
    @IBOutlet weak var enterStatsView: UIView!
    @IBOutlet weak var showStatsView: UIView!
    @IBOutlet weak var inputStatsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    
    //MARK: - Variables
    private var character = Character()
    private var totalPoint = Int()
    private var points = Int()
    private var str = 0
    private var eng = 0
    private var agi = 0
    private var sta = 0
    var subject = String()
    // MARK: - Constants
    private let alerts = Alert.sharedInstance
    
    // MARK: - Actions
    @IBAction func calculateButton(_ sender: Any) {
        
        self.character = Character(rebirth: Int(self.rebirthInput.text!), level: Int(self.levelInput.text!), fruits: Int(self.fruitStatsInput.text!))
        
        self.strField.text = ""
        self.agiField.text = ""
        self.staField.text = ""
        
        if self.validationForRebirth(self.rebirthInput.text) && validationForLevels(self.levelInput.text) {
            self.showStatsView.isHidden = false
            self.inputStatsView.isHidden = false
            
            self.totalPoint = self.character.calculateFullStats()
            self.points = self.character.calculateStats()
            
            self.statsWithoutCreatons.text = String(self.points)
            self.totalStats.text = String(self.totalPoint)
        } else {
            self.showStatsView.isHidden = true
            self.inputStatsView.isHidden = true
            
            alerts.errorAlert(title: NSLocalizedString("Incorrect Data", comment: ""), message: NSLocalizedString("Please check that the data is correct:\nRebirth shouldn't be more than 10.\nLevel shouldn't be more than 100.", comment: ""), viewController: self)
        }
    }
    @IBAction func minusRebirth(_ sender: Any) {
        if !(self.rebirthInput.text?.isEmpty == true), let text = self.rebirthInput.text {
            if self.validationForRebirth(text) == true  {
                let rebirth: Int = Int(text)!
                if rebirth == 0 {
                    self.rebirthInput.text = "0"
                } else {
                    self.rebirthInput.text! = String(rebirth - 1)
                }
            } else {
                self.rebirthInput.text = "11"
            }
        } else {
            self.rebirthInput.text = "0"
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    @IBAction func plusRebirth(_ sender: Any) {
        if !(self.rebirthInput.text?.isEmpty == true), let text = self.rebirthInput.text {
            if self.validationForRebirth(text) == true  {
                let rebirth: Int = Int(text)!
                if rebirth >= 11 {
                    self.rebirthInput.text = "11"
                } else {
                    self.rebirthInput.text! = String(rebirth + 1)
                }
            } else {
                self.rebirthInput.text = "11"
            }
        } else {
            self.rebirthInput.text = "1"
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    @IBAction func minusLevel(_ sender: Any) {
        if !(self.levelInput.text?.isEmpty == true), let text = self.levelInput.text {
            if self.validationForLevels(text) == true  {
                let level: Int = Int(text)!
                if level == 1 {
                    self.levelInput.text = "1"
                } else {
                    self.levelInput.text! = String(level - 1)
                }
            } else {
                self.levelInput.text = "100"
            }
        } else {
            self.levelInput.text = "1"
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    @IBAction func plusLevel(_ sender: Any) {
        if !(self.levelInput.text?.isEmpty == true), let text = self.levelInput.text {
            if self.validationForLevels(text) == true  {
                let level: Int = Int(text)!
                if level >= 100 {
                    self.levelInput.text = "100"
                } else {
                    self.levelInput.text! = String(level + 1)
                }
            } else {
                self.levelInput.text = "100"
            }
        } else {
            self.levelInput.text = "1"
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    @IBAction func minusCreaton(_ sender: Any) {
        if !(self.fruitStatsInput.text?.isEmpty == true), let text = self.fruitStatsInput.text {
            let creatons: Int = Int(text)!
            if creatons == 0 {
                self.fruitStatsInput.text = "0"
            } else {
                self.fruitStatsInput.text! = String(creatons - 1)
            }
        } else {
            self.fruitStatsInput.text = "0"
        }
    }
    @IBAction func plusCreaton(_ sender: Any) {
        if !(self.fruitStatsInput.text?.isEmpty == true), let text = self.fruitStatsInput.text {
            let creatons: Int = Int(text)!
            self.fruitStatsInput.text! = String(creatons + 1)
        } else {
            self.fruitStatsInput.text = "1"
        }
    }
    
    private func initialSetup() {
        self.navigationController?.navigationBar.tintColor = .orange
        self.navigationItem.title = self.subject
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!]
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!], for: .normal)
        self.scrollView.backgroundColor = backgroundColor.withAlphaComponent(0.90)
        self.containerView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.enterStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.showStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.inputStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        
        self.calculateButtonOutlet.setTitle(NSLocalizedString("Calculate", comment: "Calculate Button"), for: .normal)
        
        self.levelInput.placeholder = "1"
        self.levelInput.attributedPlaceholder = NSAttributedString(string: "1", attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
        
        self.showStatsView.isHidden = true
        self.inputStatsView.isHidden = true
        self.calculateButtonOutlet.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
        
        self.rebirthInput.delegate = self
        self.levelInput.delegate = self
        self.fruitStatsInput.delegate = self
        
        self.strField.delegate = self
        self.agiField.delegate = self
        self.staField.delegate = self
        
        let tapper = UITapGestureRecognizer(target: self, action: #selector(endEdit(_:)))
        tapper.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapper)
        
        self.registerForNotifications()
    }
    
    deinit {
        self.deregisterFromNotifications()
    }
    
    func endEdit(_ sedner: UIGestureRecognizer) {
        self.enterStatsView.endEditing(true)
        self.inputStatsView.endEditing(true)
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private func deregisterFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let contentInset = UIEdgeInsetsMake(64.0, 0.0, keyboardSize.height,  0.0)
                
                self.scrollView.contentInset = contentInset
                self.scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.scrollView.contentInset = UIEdgeInsetsMake(64.0, 0.0, 0.0,  0.0)
        self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(64.0, 0.0, 0.0,  0.0)
    }
    
    private func updateStats(_ textField: String?, stat: Stats) {
        
        if !((textField?.isEmpty)!) && validationForCreatons(textField) {
            if stat == .str {
                self.str = Int(textField!)!
                self.totalPoint = self.totalPoint - self.str
            }
            if stat == .agi {
                self.agi = Int(textField!)!
                self.totalPoint = self.totalPoint - self.agi
            }
            if stat == .sta {
                self.sta = Int(textField!)!
                self.totalPoint = self.totalPoint - self.sta
            }
            self.totalStats.text = String(self.totalPoint)
        }
        
        if (textField == "0" || (textField?.isEmpty)!) && stat == .str {
            self.str = 0
            self.totalPoint = self.character.calculateFullStats() - self.str - self.agi - self.sta
            self.totalStats.text = String(self.totalPoint)
        }
        if (textField == "0" || (textField?.isEmpty)!) && stat == .agi {
            self.agi = 0
            self.totalPoint = self.character.calculateFullStats() - self.str - self.agi - self.sta
            self.totalStats.text = String(self.totalPoint)
        }
        if (textField == "0" || (textField?.isEmpty)!) && stat == .sta {
            self.sta = 0
            self.totalPoint = self.character.calculateFullStats() - self.str - self.agi - self.sta
            self.totalStats.text = String(self.totalPoint)
        }
    }
    
    /// Reset all objects in this view to its inital state
    func resetView(){
        self.resignFirstResponder()
        self.closekeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.rebirthInput.keyboardType = .numberPad
        self.levelInput.keyboardType = .numberPad
        self.fruitStatsInput.keyboardType = .numberPad
        self.strField.keyboardType = .numberPad
        self.agiField.keyboardType = .numberPad
        self.staField.keyboardType = .numberPad
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.rebirthInput.resignFirstResponder()
        self.levelInput.resignFirstResponder()
        self.fruitStatsInput.resignFirstResponder()
        self.strField.resignFirstResponder()
        self.agiField.resignFirstResponder()
        self.staField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        } else {
            self.calculateButtonOutlet.isEnabled = false
            self.showStatsView.isHidden = true
            self.inputStatsView.isHidden = true
        }
        
        
        if !((self.strField.text?.isEmpty)!) && self.strField.resignFirstResponder() && validationForCreatons(self.strField.text) {
            if Int(self.strField.text!)! > self.totalPoint {
                self.strField.text = String(self.totalPoint)
                self.updateStats(self.strField.text, stat: .str)
            } else {
                self.updateStats(self.strField.text, stat: .str)
            }
        } else if (self.strField.text?.isEmpty)! || self.strField.text == "0" {
            self.updateStats("0", stat: .str)
        }
        
        if !((self.agiField.text?.isEmpty)!) && self.agiField.resignFirstResponder() && validationForCreatons(self.agiField.text) {
            if Int(self.agiField.text!)! > self.totalPoint {
                self.agiField.text = String(self.totalPoint)
                self.updateStats(self.agiField.text, stat: .agi)
            } else {
                self.updateStats(self.agiField.text, stat: .agi)
            }
        } else if (self.agiField.text?.isEmpty)! || self.agiField.text == "0" {
            self.updateStats("0", stat: .agi)
        }
        
        if !((self.staField.text?.isEmpty)!) && self.staField.resignFirstResponder() && validationForCreatons(self.staField.text) {
            if Int(self.staField.text!)! > self.totalPoint {
                self.staField.text = String(self.totalPoint)
                self.updateStats(self.staField.text, stat: .sta)
            } else {
                self.updateStats(self.staField.text, stat: .sta)
            }
        } else if (self.staField.text?.isEmpty)! || self.staField.text == "0" {
            self.updateStats("0", stat: .sta)
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.rebirthInput.text = ""
        self.rebirthInput.resignFirstResponder()
        self.levelInput.text = ""
        self.levelInput.resignFirstResponder()
        self.fruitStatsInput.text = ""
        self.fruitStatsInput.resignFirstResponder()
        self.strField.text = ""
        self.strField.resignFirstResponder()
        self.agiField.text = ""
        self.agiField.resignFirstResponder()
        self.staField.text = ""
        self.staField.resignFirstResponder()
        return false
    }
    
    // MARK: Helper Methods
    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func validationForRebirth(_ enteredData: String?) -> Bool {
        
        guard let enteredData = enteredData else {
            return false
        }
        
        let format = "[0-9]{1}|10|11"
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return formatPredicate.evaluate(with: enteredData)
    }
    
    func validationForLevels(_ enteredData: String?) -> Bool {
        
        guard let enteredData = enteredData else {
            return false
        }
        
        let format = "(?:(?!0)[0-9]{1,2}|100)"
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return formatPredicate.evaluate(with: enteredData)
    }
    
    func validationForCreatons(_ enteredData: String?) -> Bool {
        
        guard let enteredData = enteredData else {
            return false
        }
        
        let format = "[0-9]{1,5}"
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return formatPredicate.evaluate(with: enteredData)
    }
}
