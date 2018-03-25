//
//  ElfViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/11/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class ElfViewController: UIViewController, UITextFieldDelegate, saveDataDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var rebirthInput: UITextField!
    @IBOutlet weak var levelInput: UITextField!
    @IBOutlet weak var fruitStatsInput: UITextField!
    
    @IBOutlet weak var strField: UITextField!
    @IBOutlet weak var agiField: UITextField!
    @IBOutlet weak var staField: UITextField!
    
    @IBOutlet weak var totalStats: UILabel!
    @IBOutlet weak var statsWithoutCreatons: UILabel!
    @IBOutlet weak var weapon: LabelWhiteColorClass!
    @IBOutlet weak var set: LabelWhiteColorClass!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var enterStatsView: UIView!
    @IBOutlet weak var showStatsView: UIView!
    @IBOutlet weak var inputStatsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var showItemsView: ShowItemsView!
    
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    
    @IBOutlet weak var goldenSwordSlider: RelictSlider!
    @IBOutlet weak var goldenCrownSlider: RelictSlider!
    @IBOutlet weak var goldenGrailSlider: RelictSlider!
    
    @IBOutlet weak var goldenSwordMaxValue: LabelWhiteColorClass!
    @IBOutlet weak var goldenCrownMaxValue: LabelWhiteColorClass!
    @IBOutlet weak var goldenGrailMaxValue: LabelWhiteColorClass!
    
    // MARK: - Constraints
    @IBOutlet weak var showResultsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var evaluateStatsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var showItemsHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Variables
    var character = Character()
    private var totalPoint = Int()
    private var points = Int()
    private var str = 0
    private var eng = 0
    private var agi = 0
    private var sta = 0
    private var goldenSwordPoints = 0
    private var goldenCrownPoints = 0
    private var goldenGrailPoints = 0
    var subject = String()
    private var isCalculated: Bool = false
    
    // MARK: - Constants
    private let alerts = Alert.sharedInstance
    private let saveStats = SaveStats(character: Classes.elf.rawValue)
    var iPadViewController: IPadViewController?
    private let weapons = Weapon(belongsTo: Classes.elf)
    private let armors = Armor(belongsTo: Classes.elf)
    
    // MARK: - Actions
    @IBAction func calculateGoldenSword(_ sender: UISlider) {
        self.goldenSwordPoints = Int(round(sender.value / 10) * 10)
        if self.goldenSwordPoints != 0 {
            self.goldenSwordMaxValue.text = String(self.goldenSwordPoints)
        } else {
            self.goldenSwordMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateGoldenCrown(_ sender: UISlider) {
        self.goldenCrownPoints = Int(round(sender.value / 10) * 10)
        if self.goldenCrownPoints != 0 {
            self.goldenCrownMaxValue.text = String(self.goldenCrownPoints)
        } else {
            self.goldenCrownMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateGoldenGrail(_ sender: UISlider) {
        self.goldenGrailPoints = Int(round(sender.value / 10) * 10)
        if self.goldenGrailPoints != 0 {
            self.goldenGrailMaxValue.text = String(self.goldenGrailPoints)
        } else {
            self.goldenGrailMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        self.isCalculated = true
        self.character = Character(rebirth: Int(self.rebirthInput.text!), level: Int(self.levelInput.text!), fruits: Int(self.fruitStatsInput.text!))
        
        self.strField.text = ""
        self.agiField.text = ""
        self.staField.text = ""
        self.str = 0
        self.agi = 0
        self.sta = 0
        
        self.showItemsHeightConstraint.constant = 0.0
        self.showItemsView.layoutIfNeeded()
        
        if self.validationForRebirth(self.rebirthInput.text) && validationForLevels(self.levelInput.text) {
            self.showStatsView.isHidden = false
            self.inputStatsView.isHidden = false
            self.showItemsView.isHidden = true
            
            self.totalPoint = self.character.calculateFullStats() + self.goldenSwordPoints + self.goldenCrownPoints + self.goldenGrailPoints
            self.points = self.character.calculateStats() + self.goldenSwordPoints + self.goldenCrownPoints + self.goldenGrailPoints
            
            self.statsWithoutCreatons.text = String(self.points)
            self.totalStats.text = String(self.totalPoint)
        } else {
            self.showStatsView.isHidden = true
            self.inputStatsView.isHidden = true
            self.showItemsView.isHidden = true
        }
        
        self.showResultsHeightConstraint.constant = 100.0
        self.evaluateStatsHeightConstraint.constant = 130.0
        self.showStatsView.layoutIfNeeded()
        self.inputStatsView.layoutIfNeeded()
        self.scrollView.layoutIfNeeded()
    }
    
    @IBAction func minusRebirth(_ sender: Any) {
        if !(self.rebirthInput.text?.isEmpty == true) && validationForRebirth(self.rebirthInput.text), let text = self.rebirthInput.text {
            let rebirth: Int = Int(text)!
            if rebirth == 0 {
                self.rebirthInput.text = rebirthMinValue
            } else {
                self.rebirthInput.text! = String(rebirth - 1)
            }
        } else {
            self.rebirthInput.text = rebirthMinValue
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func plusRebirth(_ sender: Any) {
        if !(self.rebirthInput.text?.isEmpty == true) && validationForRebirth(self.rebirthInput.text), let text = self.rebirthInput.text {
            let rebirth: Int = Int(text)!
            if rebirth >= 11 {
                self.rebirthInput.text = rebirthMaxValue
            } else {
                self.rebirthInput.text! = String(rebirth + 1)
            }
        } else {
            self.rebirthInput.text = "1"
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func minusLevel(_ sender: Any) {
        if !(self.levelInput.text?.isEmpty == true) && validationForLevels(self.levelInput.text), let text = self.levelInput.text {
            let level: Int = Int(text)!
            if level == 1 {
                self.levelInput.text = levelMinValue
            } else {
                self.levelInput.text! = String(level - 1)
            }
        } else {
            self.levelInput.text = levelMinValue
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func plusLevel(_ sender: Any) {
        if !(self.levelInput.text?.isEmpty == true) && validationForLevels(self.levelInput.text), let text = self.levelInput.text {
            let level: Int = Int(text)!
            if level >= 100 {
                self.levelInput.text = levelMaxValue
            } else {
                self.levelInput.text! = String(level + 1)
            }
        } else {
            self.levelInput.text = levelMinValue
        }
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func minusCreaton(_ sender: Any) {
        if !(self.fruitStatsInput.text?.isEmpty == true) && validationForCreatons(self.fruitStatsInput.text), let text = self.fruitStatsInput.text {
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
        if !(self.fruitStatsInput.text?.isEmpty == true) && validationForCreatons(self.fruitStatsInput.text), let text = self.fruitStatsInput.text {
            let creatons: Int = Int(text)!
            self.fruitStatsInput.text! = String(creatons + 1)
        } else {
            self.fruitStatsInput.text = "1"
        }
    }
    
    func saveData(_ isActive: Bool, clas: Classes) {
        if self.calculateButtonOutlet.isEnabled == true && clas == Classes.elf {
            saveStats.saveData(self.rebirthInput.text, key: InputStats.rebirth.key)
            saveStats.saveData(self.levelInput.text, key: InputStats.level.key)
            saveStats.saveData(self.fruitStatsInput.text, key: InputStats.creaton.key)
            saveStats.saveData(self.goldenSwordPoints, key: InputStats.goldenSword.key)
            saveStats.saveData(self.goldenCrownPoints, key: InputStats.goldenCrown.key)
            saveStats.saveData(self.goldenGrailPoints, key: InputStats.goldenGrail.key)
        }
        
        if isActive && clas == Classes.elf {
            self.resetViewControllerContent()
        }
    }
    
    private func resetViewControllerContent() {
        self.showStatsView.isHidden = true
        self.inputStatsView.isHidden = true
        self.showItemsView.isHidden = true
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
        
        self.levelInput.placeholder = levelMinValue
        self.levelInput.attributedPlaceholder = NSAttributedString(string: levelMinValue, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
        
        self.showStatsView.isHidden = true
        self.inputStatsView.isHidden = true
        self.showItemsView.isHidden = true
        self.calculateButtonOutlet.isEnabled = false
    }
    
    private func calculateHeightOfScreen() -> CGFloat {
        let totalHeight = self.enterStatsView.frame.height + self.inputStatsView.frame.height + self.showStatsView.frame.height + self.showItemsView.frame.height + 50.0
        return totalHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
        
        self.rebirthInput.text = saveStats.getData(key: InputStats.rebirth.key)
        self.levelInput.text = saveStats.getData(key: InputStats.level.key)
        self.fruitStatsInput.text = saveStats.getData(key: InputStats.creaton.key)
        
        self.goldenSwordPoints = saveStats.getData(key: InputStats.goldenSword.key)
        self.goldenCrownPoints = saveStats.getData(key: InputStats.goldenCrown.key)
        self.goldenGrailPoints = saveStats.getData(key: InputStats.goldenGrail.key)
        
        if self.goldenSwordPoints != 0 {
            self.goldenSwordMaxValue.text = String(self.goldenSwordPoints)
            self.goldenSwordSlider.value = Float(self.goldenSwordPoints)
        }
        
        if self.goldenCrownPoints != 0 {
            self.goldenCrownMaxValue.text = String(self.goldenCrownPoints)
            self.goldenCrownSlider.value = Float(self.goldenCrownPoints)
        }
        
        if self.goldenGrailPoints != 0 {
            self.goldenGrailMaxValue.text = String(self.goldenGrailPoints)
            self.goldenGrailSlider.value = Float(self.goldenGrailPoints)
        }
        
        if !(self.rebirthInput.text?.isEmpty)! || !(self.levelInput.text?.isEmpty)! {
            self.calculateButtonOutlet.isEnabled = true
        }
        
        self.rebirthInput.delegate = self
        self.levelInput.delegate = self
        self.fruitStatsInput.delegate = self
        
        self.strField.delegate = self
        self.agiField.delegate = self
        self.staField.delegate = self
        
        self.strField.addTarget(self, action: #selector(strFieldDidChange(textField:)), for: .editingDidEnd)
        self.agiField.addTarget(self, action: #selector(agiFieldDidChange(textField:)), for: .editingDidEnd)
        self.staField.addTarget(self, action: #selector(staFieldDidChange(textField:)), for: .editingDidEnd)
        
        if let ipad = iPadViewController {
            ipad.delegateELF = self
        }
        
        let tapper = UITapGestureRecognizer(target: self, action: #selector(endEdit(_:)))
        tapper.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapper)
        
        self.registerForNotifications()
        
        self.showResultsHeightConstraint.constant = 0.0
        self.evaluateStatsHeightConstraint.constant = 0.0
        self.showItemsHeightConstraint.constant = 0.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: calculateHeightOfScreen())
    }
    
    deinit {
        self.deregisterFromNotifications()
        
        if self.isCalculated == true {
            saveStats.saveData(self.rebirthInput.text, key: InputStats.rebirth.key)
            saveStats.saveData(self.levelInput.text, key: InputStats.level.key)
            saveStats.saveData(self.fruitStatsInput.text, key: InputStats.creaton.key)
            saveStats.saveData(self.goldenSwordPoints, key: InputStats.goldenSword.key)
            saveStats.saveData(self.goldenCrownPoints, key: InputStats.goldenCrown.key)
            saveStats.saveData(self.goldenGrailPoints, key: InputStats.goldenGrail.key)
        }
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
                let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height,  0.0)
                
                self.scrollView.contentInset = contentInset
                self.scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
            self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
            self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        }
    }
    
    private func updateStats(_ textField: String?, stat: Stats) {
        if validationForCreatons(textField) {
            if stat == .str {
                if !(self.strField.text?.isEmpty)! {
                    self.str =  Int(self.strField.text!)!
                } else {
                    self.str = 0
                }
            }
            if stat == .agi {
                if !(self.agiField.text?.isEmpty)! {
                    self.agi = Int(self.agiField.text!)!
                } else {
                    self.agi = 0
                }
            }
            if stat == .sta {
               if !(self.staField.text?.isEmpty)! {
                    self.sta = Int(self.staField.text!)!
                } else {
                    self.sta = 0
                }
            }
        }

        self.totalPoint = self.character.calculateFullStats() + self.goldenSwordPoints + self.goldenCrownPoints + self.goldenGrailPoints - self.str - self.agi - self.sta
        self.totalStats.text = String(self.totalPoint)

        if (self.strField.text?.isEmpty)! || (self.agiField.text?.isEmpty)! || (self.staField.text?.isEmpty)! {
            self.showItemsView.isHidden = true
            self.showItemsHeightConstraint.constant = 0.0
            self.showItemsView.layoutIfNeeded()
        } else {
            self.showItemsView.isHidden = false
            self.showItemsHeightConstraint.constant = 100.0
            self.showItemsView.layoutIfNeeded()

            let wp = weapons.getItem(str: self.str, agi: self.agi, sta: self.sta)
            let arm = armors.getItem(str: self.str, agi: self.agi, sta: self.sta)
            if wp.tier != nil && wp.name != nil {
                self.weapon.text = "T\(wp.tier!): \(wp.name!)"
            } else {
                self.weapon.text = ""
            }
            if arm.tier != nil && arm.name != nil {
                self.set.text = "T\(arm.tier!): \(arm.name!)"
            } else {
                self.set.text = ""
            }
        }
    }
    
    func strFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && validationForCreatons(textField.text) {
            if Int(textField.text!)! > self.totalPoint && self.totalPoint != 0 {
                if Int(textField.text!)! > self.totalPoint + self.str {
                    self.strField.text = String(self.totalPoint + self.str)
                    self.updateStats(self.strField.text, stat: .str)
                } else {
                    self.updateStats(textField.text, stat: .str)
                }
            } else if Int(textField.text!)! > self.totalPoint && self.totalPoint == 0 {
                if Int(textField.text!)! > self.str {
                    self.totalPoint = 0
                    self.strField.text = String(self.str)
                } else {
                    self.updateStats(textField.text, stat: .str)
                }
            } else {
                self.updateStats(self.strField.text, stat: .str)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            self.updateStats("0", stat: .str)
        }
    }
    
    func agiFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && validationForCreatons(textField.text) {
            if Int(textField.text!)! > self.totalPoint && self.totalPoint != 0 {
                if Int(textField.text!)! > self.totalPoint + self.agi {
                    self.agiField.text = String(self.totalPoint + self.agi)
                    self.updateStats(self.agiField.text, stat: .agi)
                } else {
                    self.updateStats(textField.text, stat: .agi)
                }
            } else if Int(textField.text!)! > self.totalPoint && self.totalPoint == 0 {
                if Int(textField.text!)! > self.agi {
                    self.totalPoint = 0
                    self.agiField.text = String(self.agi)
                } else {
                    self.updateStats(textField.text, stat: .agi)
                }
            } else {
                self.updateStats(self.agiField.text, stat: .agi)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            self.updateStats("0", stat: .agi)
        }
    }
    
    func staFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && validationForCreatons(textField.text) {
            if Int(textField.text!)! > self.totalPoint && self.totalPoint != 0 {
                if Int(textField.text!)! > self.totalPoint + self.sta {
                    self.staField.text = String(self.totalPoint + self.sta)
                    self.updateStats(self.staField.text, stat: .sta)
                } else {
                    self.updateStats(textField.text, stat: .sta)
                }
            } else if Int(textField.text!)! > self.totalPoint && self.totalPoint == 0 {
                if Int(textField.text!)! > self.sta {
                    self.totalPoint = 0
                    self.staField.text = String(self.sta)
                } else {
                    self.updateStats(textField.text, stat: .sta)
                }
            } else {
                self.updateStats(self.staField.text, stat: .sta)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            self.updateStats("0", stat: .sta)
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
            self.showItemsView.isHidden = true
            self.isCalculated = false
        }
        
        if !(self.validationForRebirth(self.rebirthInput.text)) && !(self.rebirthInput.text?.isEmpty == true) {
            self.rebirthInput.text = rebirthMinValue
        }
            
        if !(self.validationForLevels(self.levelInput.text)) && !(self.levelInput.text?.isEmpty == true) {
            self.levelInput.text = levelMinValue
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
        
        let format = "[0-9]{1}|10|11|12"
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
        
        let format = "[0-9]{1,6}"
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return formatPredicate.evaluate(with: enteredData)
    }
}
