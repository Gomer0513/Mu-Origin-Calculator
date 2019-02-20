//
//  ElfViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/11/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class ElfViewController: UIViewController {
    
    // MARK: - IBOutlets
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
    fileprivate var totalPoint = Int()
    fileprivate var points = Int()
    fileprivate var str = 0
    fileprivate var eng = 0
    fileprivate var agi = 0
    fileprivate var sta = 0
    fileprivate var goldenSwordPoints = 0
    fileprivate var goldenCrownPoints = 0
    fileprivate var goldenGrailPoints = 0
    var subject = String()
    fileprivate var isCalculated: Bool = false
    
    // MARK: - Constants
    fileprivate let alerts = Alert.sharedInstance
    fileprivate let saveStats = SaveStats(character: Classes.elf.rawValue)
    var iPadViewController: IPadViewController?
    fileprivate let weapons = Weapon(belongsTo: Classes.elf)
    fileprivate let armors = Armor(belongsTo: Classes.elf)
    
    // MARK: - IBActions
    @IBAction func calculateGoldenSword(_ sender: UISlider) {
        goldenSwordPoints = Int(round(sender.value / 10) * 10)
        if goldenSwordPoints != 0 {
            goldenSwordMaxValue.text = String(goldenSwordPoints)
        } else {
            goldenSwordMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateGoldenCrown(_ sender: UISlider) {
        goldenCrownPoints = Int(round(sender.value / 10) * 10)
        if goldenCrownPoints != 0 {
            goldenCrownMaxValue.text = String(goldenCrownPoints)
        } else {
            goldenCrownMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateGoldenGrail(_ sender: UISlider) {
        goldenGrailPoints = Int(round(sender.value / 10) * 10)
        if goldenGrailPoints != 0 {
            goldenGrailMaxValue.text = String(goldenGrailPoints)
        } else {
            goldenGrailMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        isCalculated = true
        character = Character(rebirth: Int(rebirthInput.text!), level: Int(levelInput.text!), fruits: Int(fruitStatsInput.text!))
        
        strField.text = ""
        agiField.text = ""
        staField.text = ""
        str = 0
        agi = 0
        sta = 0
        
        showItemsHeightConstraint.constant = 0.0
        showItemsView.layoutIfNeeded()
        
        if StatsValidation.forRebirth(rebirthInput.text) && StatsValidation.forLevels(levelInput.text) {
            showStatsView.isHidden = false
            inputStatsView.isHidden = false
            showItemsView.isHidden = true
            
            totalPoint = character.calculateFullStats() + goldenSwordPoints + goldenCrownPoints + goldenGrailPoints
            points = character.calculateStats() + goldenSwordPoints + goldenCrownPoints + goldenGrailPoints
            
            statsWithoutCreatons.text = String(points)
            totalStats.text = String(totalPoint)
        } else {
            showStatsView.isHidden = true
            inputStatsView.isHidden = true
            showItemsView.isHidden = true
        }
        
        showResultsHeightConstraint.constant = 100.0
        evaluateStatsHeightConstraint.constant = 130.0
        showStatsView.layoutIfNeeded()
        inputStatsView.layoutIfNeeded()
        scrollView.layoutIfNeeded()
    }
    
    @IBAction func minusRebirth(_ sender: Any) {
        if !(rebirthInput.text?.isEmpty == true) && StatsValidation.forRebirth(rebirthInput.text), let text = rebirthInput.text {
            let rebirth: Int = Int(text)!
            if rebirth == 0 {
                rebirthInput.text = rebirthMinValue
            } else {
                rebirthInput.text! = String(rebirth - 1)
            }
        } else {
            rebirthInput.text = rebirthMinValue
        }
        
        if !(rebirthInput.text?.isEmpty)! && !(levelInput.text?.isEmpty)! {
            calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func plusRebirth(_ sender: Any) {
        if !(rebirthInput.text?.isEmpty == true) && StatsValidation.forRebirth(rebirthInput.text), let text = rebirthInput.text {
            let rebirth: Int = Int(text)!
            if rebirth >= Int(rebirthMaxValue)! {
                rebirthInput.text = rebirthMaxValue
            } else {
                rebirthInput.text! = String(rebirth + 1)
            }
        } else {
            rebirthInput.text = "1"
        }
        
        if !(rebirthInput.text?.isEmpty)! && !(levelInput.text?.isEmpty)! {
            calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func minusLevel(_ sender: Any) {
        if !(levelInput.text?.isEmpty == true) && StatsValidation.forLevels(levelInput.text), let text = levelInput.text {
            let level: Int = Int(text)!
            if level == 1 {
                levelInput.text = levelMinValue
            } else {
                levelInput.text! = String(level - 1)
            }
        } else {
            levelInput.text = levelMinValue
        }
        
        if !(rebirthInput.text?.isEmpty)! && !(levelInput.text?.isEmpty)! {
            calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func plusLevel(_ sender: Any) {
        if !(levelInput.text?.isEmpty == true) && StatsValidation.forLevels(levelInput.text), let text = levelInput.text {
            let level: Int = Int(text)!
            if level >= 100 {
                levelInput.text = levelMaxValue
            } else {
                levelInput.text! = String(level + 1)
            }
        } else {
            levelInput.text = levelMinValue
        }
        
        if !(rebirthInput.text?.isEmpty)! && !(levelInput.text?.isEmpty)! {
            calculateButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func minusCreaton(_ sender: Any) {
        if !(fruitStatsInput.text?.isEmpty == true) && StatsValidation.forCreatons(fruitStatsInput.text), let text = fruitStatsInput.text {
            let creatons: Int = Int(text)!
            if creatons == 0 {
                fruitStatsInput.text = "0"
            } else {
                fruitStatsInput.text! = String(creatons - 1)
            }
        } else {
            fruitStatsInput.text = "0"
        }
    }
    
    @IBAction func plusCreaton(_ sender: Any) {
        if !(fruitStatsInput.text?.isEmpty == true) && StatsValidation.forCreatons(fruitStatsInput.text), let text = fruitStatsInput.text {
            let creatons: Int = Int(text)!
            fruitStatsInput.text! = String(creatons + 1)
        } else {
            fruitStatsInput.text = "1"
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
        rebirthInput.text = saveStats.getData(key: InputStats.rebirth.key)
        levelInput.text = saveStats.getData(key: InputStats.level.key)
        fruitStatsInput.text = saveStats.getData(key: InputStats.creaton.key)
        
        goldenSwordPoints = saveStats.getData(key: InputStats.goldenSword.key)
        goldenCrownPoints = saveStats.getData(key: InputStats.goldenCrown.key)
        goldenGrailPoints = saveStats.getData(key: InputStats.goldenGrail.key)
        
        if goldenSwordPoints != 0 {
            goldenSwordMaxValue.text = String(goldenSwordPoints)
            goldenSwordSlider.value = Float(goldenSwordPoints)
        }
        
        if goldenCrownPoints != 0 {
            goldenCrownMaxValue.text = String(goldenCrownPoints)
            goldenCrownSlider.value = Float(goldenCrownPoints)
        }
        
        if goldenGrailPoints != 0 {
            goldenGrailMaxValue.text = String(goldenGrailPoints)
            goldenGrailSlider.value = Float(goldenGrailPoints)
        }
        
        if !(rebirthInput.text?.isEmpty)! || !(levelInput.text?.isEmpty)! {
            calculateButtonOutlet.isEnabled = true
        }
        
        rebirthInput.delegate = self
        levelInput.delegate = self
        fruitStatsInput.delegate = self
        
        strField.delegate = self
        agiField.delegate = self
        staField.delegate = self
        
        strField.addTarget(self, action: #selector(strFieldDidChange(textField:)), for: .editingDidEnd)
        agiField.addTarget(self, action: #selector(agiFieldDidChange(textField:)), for: .editingDidEnd)
        staField.addTarget(self, action: #selector(staFieldDidChange(textField:)), for: .editingDidEnd)
        
        if let ipad = iPadViewController {
            ipad.delegateELF = self
        }
        
        let tapper = UITapGestureRecognizer(target: self, action: #selector(endEdit(_:)))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
        
        registerForNotifications()
        
        showResultsHeightConstraint.constant = 0.0
        evaluateStatsHeightConstraint.constant = 0.0
        showItemsHeightConstraint.constant = 0.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.width, height: calculateHeightOfScreen())
    }
    
    deinit {
        deregisterFromNotifications()
        
        if isCalculated == true {
            saveStats.saveData(rebirthInput.text, key: InputStats.rebirth.key)
            saveStats.saveData(levelInput.text, key: InputStats.level.key)
            saveStats.saveData(fruitStatsInput.text, key: InputStats.creaton.key)
            saveStats.saveData(goldenSwordPoints, key: InputStats.goldenSword.key)
            saveStats.saveData(goldenCrownPoints, key: InputStats.goldenCrown.key)
            saveStats.saveData(goldenGrailPoints, key: InputStats.goldenGrail.key)
        }
    }
    
    // MARK: - Methods
    
    fileprivate func resetViewControllerContent() {
        showStatsView.isHidden = true
        inputStatsView.isHidden = true
        showItemsView.isHidden = true
    }
    
    private func initialSetup() {
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.title = subject
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!]
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!], for: .normal)
        scrollView.backgroundColor = backgroundColor.withAlphaComponent(0.90)
        containerView.backgroundColor = backgroundColor.withAlphaComponent(0)
        enterStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        showStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        inputStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        
        calculateButtonOutlet.setTitle(NSLocalizedString("Calculate", comment: "Calculate Button"), for: .normal)
        
        levelInput.placeholder = levelMinValue
        levelInput.attributedPlaceholder = NSAttributedString(string: levelMinValue, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
        
        showStatsView.isHidden = true
        inputStatsView.isHidden = true
        showItemsView.isHidden = true
        calculateButtonOutlet.isEnabled = false
    }
    
    private func calculateHeightOfScreen() -> CGFloat {
        let totalHeight = enterStatsView.frame.height + inputStatsView.frame.height + showStatsView.frame.height + showItemsView.frame.height + 50.0
        return totalHeight
    }
    
    func endEdit(_ sedner: UIGestureRecognizer) {
        enterStatsView.endEditing(true)
        inputStatsView.endEditing(true)
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private func deregisterFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height,  0.0)
                
                scrollView.contentInset = contentInset
                scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
            scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
            scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        }
    }
}

// MARK: - UITextFieldDelegate

extension ElfViewController: UITextFieldDelegate {
    private func updateStats(_ textField: String?, stat: Stats) {
        if StatsValidation.forCreatons(textField) {
            if stat == .str {
                if !(strField.text?.isEmpty)! {
                    str =  Int(strField.text!)!
                } else {
                    str = 0
                }
            }
            if stat == .agi {
                if !(agiField.text?.isEmpty)! {
                    agi = Int(agiField.text!)!
                } else {
                    agi = 0
                }
            }
            if stat == .sta {
                if !(staField.text?.isEmpty)! {
                    sta = Int(staField.text!)!
                } else {
                    sta = 0
                }
            }
        }
        
        totalPoint = character.calculateFullStats() + goldenSwordPoints + goldenCrownPoints + goldenGrailPoints - str - agi - sta
        totalStats.text = String(totalPoint)
        
        if (strField.text?.isEmpty)! || (agiField.text?.isEmpty)! || (staField.text?.isEmpty)! {
            showItemsView.isHidden = true
            showItemsHeightConstraint.constant = 0.0
            showItemsView.layoutIfNeeded()
        } else {
            showItemsView.isHidden = false
            showItemsHeightConstraint.constant = 100.0
            showItemsView.layoutIfNeeded()
            
            let wp = weapons.getItem(str: str, agi: agi, sta: sta)
            let arm = armors.getItem(str: str, agi: agi, sta: sta)
            if wp.tier != nil && wp.name != nil {
                weapon.text = "T\(wp.tier!): \(wp.name!)"
            } else {
                weapon.text = ""
            }
            if arm.tier != nil && arm.name != nil {
                set.text = "T\(arm.tier!): \(arm.name!)"
            } else {
                set.text = ""
            }
        }
    }
    
    func strFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && StatsValidation.forCreatons(textField.text) {
            if Int(textField.text!)! > totalPoint && totalPoint != 0 {
                if Int(textField.text!)! > totalPoint + str {
                    strField.text = String(totalPoint + str)
                    updateStats(strField.text, stat: .str)
                } else {
                    updateStats(textField.text, stat: .str)
                }
            } else if Int(textField.text!)! > totalPoint && totalPoint == 0 {
                if Int(textField.text!)! > str {
                    totalPoint = 0
                    strField.text = String(str)
                } else {
                    updateStats(textField.text, stat: .str)
                }
            } else {
                updateStats(strField.text, stat: .str)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            updateStats("0", stat: .str)
        }
    }
    
    func agiFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && StatsValidation.forCreatons(textField.text) {
            if Int(textField.text!)! > totalPoint && totalPoint != 0 {
                if Int(textField.text!)! > totalPoint + agi {
                    agiField.text = String(totalPoint + agi)
                    updateStats(agiField.text, stat: .agi)
                } else {
                    updateStats(textField.text, stat: .agi)
                }
            } else if Int(textField.text!)! > totalPoint && totalPoint == 0 {
                if Int(textField.text!)! > agi {
                    totalPoint = 0
                    agiField.text = String(agi)
                } else {
                    updateStats(textField.text, stat: .agi)
                }
            } else {
                updateStats(agiField.text, stat: .agi)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            updateStats("0", stat: .agi)
        }
    }
    
    func staFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && StatsValidation.forCreatons(textField.text) {
            if Int(textField.text!)! > totalPoint && totalPoint != 0 {
                if Int(textField.text!)! > totalPoint + sta {
                    staField.text = String(totalPoint + sta)
                    updateStats(staField.text, stat: .sta)
                } else {
                    updateStats(textField.text, stat: .sta)
                }
            } else if Int(textField.text!)! > totalPoint && totalPoint == 0 {
                if Int(textField.text!)! > sta {
                    totalPoint = 0
                    staField.text = String(sta)
                } else {
                    updateStats(textField.text, stat: .sta)
                }
            } else {
                updateStats(staField.text, stat: .sta)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            updateStats("0", stat: .sta)
        }
    }
    
    /// Reset all objects in this view to its inital state
    func resetView(){
        resignFirstResponder()
        closekeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        rebirthInput.keyboardType = .numberPad
        levelInput.keyboardType = .numberPad
        fruitStatsInput.keyboardType = .numberPad
        strField.keyboardType = .numberPad
        agiField.keyboardType = .numberPad
        staField.keyboardType = .numberPad
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rebirthInput.resignFirstResponder()
        levelInput.resignFirstResponder()
        fruitStatsInput.resignFirstResponder()
        strField.resignFirstResponder()
        agiField.resignFirstResponder()
        staField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(rebirthInput.text?.isEmpty)! && !(levelInput.text?.isEmpty)! {
            calculateButtonOutlet.isEnabled = true
        } else {
            calculateButtonOutlet.isEnabled = false
            showStatsView.isHidden = true
            inputStatsView.isHidden = true
            showItemsView.isHidden = true
            isCalculated = false
        }
        
        if !(StatsValidation.forRebirth(rebirthInput.text)) && !(rebirthInput.text?.isEmpty == true) {
            rebirthInput.text = rebirthMinValue
        }
        
        if !(StatsValidation.forLevels(levelInput.text)) && !(levelInput.text?.isEmpty == true) {
            levelInput.text = levelMinValue
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        rebirthInput.text = ""
        rebirthInput.resignFirstResponder()
        levelInput.text = ""
        levelInput.resignFirstResponder()
        fruitStatsInput.text = ""
        fruitStatsInput.resignFirstResponder()
        strField.text = ""
        strField.resignFirstResponder()
        agiField.text = ""
        agiField.resignFirstResponder()
        staField.text = ""
        staField.resignFirstResponder()
        return false
    }
    
    // MARK: Helper Methods
    func closekeyboard() {
        view.endEditing(true)
    }
    
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

// MARK: - saveDataDelegate

extension ElfViewController: SaveDataDelegate {
    func saveData(_ isActive: Bool, clas: Classes) {
        if calculateButtonOutlet.isEnabled == true && clas == Classes.elf {
            saveStats.saveData(rebirthInput.text, key: InputStats.rebirth.key)
            saveStats.saveData(levelInput.text, key: InputStats.level.key)
            saveStats.saveData(fruitStatsInput.text, key: InputStats.creaton.key)
            saveStats.saveData(goldenSwordPoints, key: InputStats.goldenSword.key)
            saveStats.saveData(goldenCrownPoints, key: InputStats.goldenCrown.key)
            saveStats.saveData(goldenGrailPoints, key: InputStats.goldenGrail.key)
        }
        
        if isActive && clas == Classes.elf {
            resetViewControllerContent()
        }
    }
}
