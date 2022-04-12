//
//  DarkWizardViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/11/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class DarkWizardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var rebirthInput: UITextField!
    @IBOutlet weak var levelInput: UITextField!
    @IBOutlet weak var fruitStatsInput: UITextField!
    
    @IBOutlet weak var engField: UITextField!
    @IBOutlet weak var agiField: UITextField!
    @IBOutlet weak var staField: UITextField!
    
    @IBOutlet weak var totalStats: UILabel!
    @IBOutlet weak var statsWithoutCreatons: UILabel!
    @IBOutlet weak var weapon: LabelWhiteColorClass!
    @IBOutlet weak var set: LabelWhiteColorClass!
    
    @IBOutlet weak var enterStatsView: UIView!
    @IBOutlet weak var showStatsView: UIView!
    @IBOutlet weak var inputStatsView: UIView!
    
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var showItemsView: ShowItemsView!
    
    @IBOutlet weak var goldenCrownSlider: RelictSlider!
    @IBOutlet weak var goldenScriptureSlider: RelictSlider!
    @IBOutlet weak var goldenGrailSlider: RelictSlider!
    
    @IBOutlet weak var goldenCrownMaxValue: LabelWhiteColorClass!
    @IBOutlet weak var goldenGrailMaxValue: LabelWhiteColorClass!
    @IBOutlet weak var goldenScriptureMaxValue: LabelWhiteColorClass!
    
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
    fileprivate var goldenCrownPoints = 0
    fileprivate var goldenGrailPoints = 0
    fileprivate var goldenScripturePoints = 0
    var subject = String()
    fileprivate var isCalculated: Bool = false
    var iPadViewController: IPadViewController?
    
    // MARK: - Constants
    fileprivate let alerts = Alert.sharedInstance
    fileprivate let saveStats = SaveStats(character: Classes.dw.rawValue)
    fileprivate let weapons = Weapon(belongsTo: Classes.dw)
    fileprivate let armors = Armor(belongsTo: Classes.dw)
    
    // MARK: - IBActions
    @IBAction func calculateGoldenCrown(_ sender: UISlider) {
        goldenCrownPoints = Int(round(sender.value / 10) * 10)
        if goldenCrownPoints != 0 {
            goldenCrownMaxValue.text = String(goldenCrownPoints)
        } else {
            goldenCrownMaxValue.text = "100"
        }
    }
    
    @IBAction func calculateGoldenScripture(_ sender: UISlider) {
        goldenScripturePoints = Int(round(sender.value / 10) * 10)
        if goldenScripturePoints != 0 {
            goldenScriptureMaxValue.text = String(goldenScripturePoints)
        } else {
            goldenScriptureMaxValue.text = "100"
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
        
        engField.text = ""
        agiField.text = ""
        staField.text = ""
        eng = 0
        agi = 0
        sta = 0
        
        showItemsHeightConstraint.constant = 0.0
        showItemsView.layoutIfNeeded()
        
        if StatsValidation.forRebirth(rebirthInput.text) && StatsValidation.forLevels(levelInput.text) {
            showStatsView.isHidden = false
            inputStatsView.isHidden = false
            showItemsView.isHidden = true
            
            totalPoint = character.calculateFullStats() + goldenCrownPoints + goldenScripturePoints + goldenGrailPoints
            points = character.calculateStats() + goldenCrownPoints + goldenScripturePoints + goldenGrailPoints
            
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
        
        goldenCrownPoints = saveStats.getData(key: InputStats.goldenCrown.key)
        goldenScripturePoints = saveStats.getData(key: InputStats.goldenScripture.key)
        goldenGrailPoints = saveStats.getData(key: InputStats.goldenGrail.key)
        
        if goldenCrownPoints != 0 {
            goldenCrownMaxValue.text = String(goldenCrownPoints)
            goldenCrownSlider.value = Float(goldenCrownPoints)
        }
        
        if goldenScripturePoints != 0 {
            goldenScriptureMaxValue.text = String(goldenScripturePoints)
            goldenScriptureSlider.value = Float(goldenScripturePoints)
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
        
        engField.delegate = self
        agiField.delegate = self
        staField.delegate = self
        
        engField.addTarget(self, action: #selector(engFieldDidChange(textField:)), for: .editingDidEnd)
        agiField.addTarget(self, action: #selector(agiFieldDidChange(textField:)), for: .editingDidEnd)
        staField.addTarget(self, action: #selector(staFieldDidChange(textField:)), for: .editingDidEnd)
        
        if let ipad = iPadViewController {
            ipad.delegateDW = self
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
            saveStats.saveData(goldenCrownPoints, key: InputStats.goldenCrown.key)
            saveStats.saveData(goldenScripturePoints, key: InputStats.goldenScripture.key)
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
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!]
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!], for: .normal)
        scrollView.backgroundColor = backgroundColor.withAlphaComponent(0.90)
        containerView.backgroundColor = backgroundColor.withAlphaComponent(0)
        enterStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        showStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        inputStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        
        calculateButtonOutlet.setTitle(NSLocalizedString("Calculate", comment: "Calculate Button"), for: .normal)
        
        levelInput.placeholder = levelMinValue
        levelInput.attributedPlaceholder = NSAttributedString(string: levelMinValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange.withAlphaComponent(0.3)])
        
        showStatsView.isHidden = true
        inputStatsView.isHidden = true
        showItemsView.isHidden = true
        calculateButtonOutlet.isEnabled = false
    }
    
    private func calculateHeightOfScreen() -> CGFloat {
        let totalHeight = enterStatsView.frame.height + inputStatsView.frame.height + showStatsView.frame.height + showItemsView.frame.height + 50.0
        return totalHeight
    }
    
    @objc func endEdit(_ sedner: UIGestureRecognizer) {
        enterStatsView.endEditing(true)
        inputStatsView.endEditing(true)
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    private func deregisterFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height,  right: 0.0)
                
                scrollView.contentInset = contentInset
                scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0,  right: 0.0)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0,  right: 0.0)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
    }
}

// MARK: - UITextFieldDelegate

extension DarkWizardViewController: UITextFieldDelegate {
    private func updateStats(_ textField: String?, stat: Stats) {
        if StatsValidation.forCreatons(textField) {
            if stat == .eng {
                if !(engField.text?.isEmpty)! {
                    eng =  Int(engField.text!)!
                } else {
                    eng = 0
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
        
        totalPoint = character.calculateFullStats() + goldenCrownPoints + goldenScripturePoints + goldenGrailPoints - eng - agi - sta
        totalStats.text = String(totalPoint)
        
        if (engField.text?.isEmpty)! || (agiField.text?.isEmpty)! || (staField.text?.isEmpty)! {
            showItemsView.isHidden = true
            showItemsHeightConstraint.constant = 0.0
            showItemsView.layoutIfNeeded()
        } else {
            showItemsView.isHidden = false
            showItemsHeightConstraint.constant = 100.0
            showItemsView.layoutIfNeeded()
            
            let wp = weapons.getItem(agi: agi, eng: eng, sta: sta)
            let arm = armors.getItem(agi: agi, eng: eng, sta: sta)
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
    
    @objc func engFieldDidChange(textField: UITextField) {
        if !((textField.text?.isEmpty)!) && StatsValidation.forCreatons(textField.text) {
            if Int(textField.text!)! > totalPoint && totalPoint != 0 {
                if Int(textField.text!)! > totalPoint + eng {
                    engField.text = String(totalPoint + eng)
                    updateStats(engField.text, stat: .eng)
                } else {
                    updateStats(textField.text, stat: .eng)
                }
            } else if Int(textField.text!)! > totalPoint && totalPoint == 0 {
                if Int(textField.text!)! > eng {
                    totalPoint = 0
                    engField.text = String(eng)
                } else {
                    updateStats(textField.text, stat: .eng)
                }
            } else {
                updateStats(engField.text, stat: .eng)
            }
        } else if (textField.text?.isEmpty)! || textField.text == "0" {
            updateStats("0", stat: .eng)
        }
    }
    
    @objc func agiFieldDidChange(textField: UITextField) {
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
    
    @objc func staFieldDidChange(textField: UITextField) {
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
        engField.keyboardType = .numberPad
        agiField.keyboardType = .numberPad
        staField.keyboardType = .numberPad
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rebirthInput.resignFirstResponder()
        levelInput.resignFirstResponder()
        fruitStatsInput.resignFirstResponder()
        engField.resignFirstResponder()
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
        engField.text = ""
        engField.resignFirstResponder()
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

extension DarkWizardViewController: SaveDataDelegate {
    func saveData(_ isActive: Bool, clas: Classes) {
        if calculateButtonOutlet.isEnabled == true && clas == Classes.dw {
            saveStats.saveData(rebirthInput.text, key: InputStats.rebirth.key)
            saveStats.saveData(levelInput.text, key: InputStats.level.key)
            saveStats.saveData(fruitStatsInput.text, key: InputStats.creaton.key)
            saveStats.saveData(goldenCrownPoints, key: InputStats.goldenCrown.key)
            saveStats.saveData(goldenScripturePoints, key: InputStats.goldenScripture.key)
            saveStats.saveData(goldenGrailPoints, key: InputStats.goldenGrail.key)
        }
        
        if isActive && clas == Classes.dw {
            resetViewControllerContent()
        }
    }
}
