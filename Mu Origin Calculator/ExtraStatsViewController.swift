//
//  ExtraStatsViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 8/9/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import UIKit

class ExtraStatsViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, saveDataDelegate {

    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var enterStatsView: UIView!
    @IBOutlet weak var achievementsView: UIView!
    @IBOutlet weak var famesView: UIView!
    @IBOutlet weak var wingsView: UIView!
    
    @IBOutlet weak var amountOfDimanondsPerDay: TextClass!

    @IBOutlet weak var achievementTitle: TextClass!
    @IBOutlet weak var fameTitle: TextClass!
    @IBOutlet weak var wingsTitle: TextClass!
    
    @IBOutlet weak var currentAchievementPoints: TextClass!
    @IBOutlet weak var currentFamePoints: TextClass!
    @IBOutlet weak var currentFlamePoints: TextClass!
    
    @IBOutlet weak var maxNumberOfAchievements: LabelWhiteColorClass!
    @IBOutlet weak var maxNumberOfFames: LabelWhiteColorClass!
    @IBOutlet weak var maxNumberOfFlames: LabelWhiteColorClass!
    
    @IBOutlet weak var achievementSlider: RelictSlider!
    @IBOutlet weak var fameSlider: RelictSlider!
    @IBOutlet weak var flameSlider: RelictSlider!
    
    @IBOutlet weak var evaluateButton: MenuButton!
    
    @IBOutlet weak var achievementViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fameViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var wingsViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    var subject = String()
    private var achievementPercent = 0
    private var famePercent = 0
    private var flamePercent = 0
    private var maxPercent = 100
    private var achievement: Day!
    private var fame: Day!
    private var flame: Day!
    var iPadViewController: IPadViewController?
    
    // MARK: - Constants
    private let saveStats = SaveStats(character: Classes.extra.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
        self.loadData()
        
        if !(self.amountOfDimanondsPerDay.text?.isEmpty)! {
            self.makeTextFieldEditable(true)
            if self.achievementSlider.value != 0 {
                self.achievementSlider.maximumValue = Float(self.maxPercent) - self.fameSlider.value - self.flameSlider.value
                self.maxNumberOfAchievements.text = String(Int(self.achievementSlider.maximumValue))
            }
            if self.fameSlider.value != 0 {
                self.fameSlider.maximumValue = Float(self.maxPercent) - self.achievementSlider.value - self.flameSlider.value
                self.maxNumberOfFames.text = String(Int(self.fameSlider.maximumValue))
            }
            if self.flameSlider.value != 0 {
                self.flameSlider.maximumValue = Float(self.maxPercent) - self.achievementSlider.value - self.fameSlider.value
                self.maxNumberOfFlames.text = String(Int(self.flameSlider.maximumValue))
            }
        }
        
        self.amountOfDimanondsPerDay.delegate = self
        self.amountOfDimanondsPerDay.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        
        self.achievementTitle.delegate = self
        self.achievementTitle.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        self.fameTitle.delegate = self
        self.fameTitle.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        self.wingsTitle.delegate = self
        self.wingsTitle.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        self.currentAchievementPoints.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        self.currentFamePoints.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        self.currentFlamePoints.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        
        let tapper = UITapGestureRecognizer(target: self, action: #selector(endEdit(_:)))
        tapper.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapper)
        
        if let ipad = iPadViewController {
            ipad.extraStatsDelegate = self
        }
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        self.achievementTitle.inputView = pickerView
        self.fameTitle.inputView = pickerView
        self.wingsTitle.inputView = pickerView
        
        self.registerForNotifications()
    }
    
    private func loadData() {
        self.amountOfDimanondsPerDay.text = saveStats.getData(key: InputStats.diamondsPerDay.key)
        self.achievementTitle.text = saveStats.getData(key: InputStats.achievementTitle.key)
        self.fameTitle.text = saveStats.getData(key: InputStats.fameTitle.key)
        self.wingsTitle.text = saveStats.getData(key: InputStats.wingsTitle.key)
        self.currentAchievementPoints.text = saveStats.getData(key: InputStats.currentAchievemntPoints.key)
        self.currentFamePoints.text = saveStats.getData(key: InputStats.currentFamePoints.key)
        self.currentFlamePoints.text = saveStats.getData(key: InputStats.currentWingsPoints.key)
        self.achievementSlider.value = saveStats.getData(key: InputStats.achievementPercentage.key)
        self.fameSlider.value = saveStats.getData(key: InputStats.famePercentage.key)
        self.flameSlider.value = saveStats.getData(key: InputStats.wingsPercentage.key)
    }
    
    private func initialSetup() {
        self.navigationController?.navigationBar.tintColor = .orange
        self.navigationItem.title = self.subject
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!]
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!], for: .normal)
        self.scrollView.backgroundColor = backgroundColor.withAlphaComponent(0.90)
        self.containerView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.enterStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.achievementsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.famesView.backgroundColor = backgroundColor.withAlphaComponent(0)
        self.wingsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        
        self.evaluateButton.setTitle("Calculate", for: .normal)
        
        self.evaluateButton.isEnabled = false
        self.makeTextFieldEditable(false)
        
        self.achievementsView.isHidden = true
        self.famesView.isHidden = true
        self.wingsView.isHidden = true
    }
    
    deinit {
        if !(self.amountOfDimanondsPerDay.text?.isEmpty)! && self.evaluateButton.isEnabled {
            saveStats.saveData(self.amountOfDimanondsPerDay.text, key: InputStats.diamondsPerDay.key)
            saveStats.saveData(self.achievementTitle.text, key: InputStats.achievementTitle.key)
            saveStats.saveData(self.fameTitle.text, key: InputStats.fameTitle.key)
            saveStats.saveData(self.wingsTitle.text, key: InputStats.wingsTitle.key)
            saveStats.saveData(self.achievementPercent, key: InputStats.achievementPercentage.key)
            saveStats.saveData(self.famePercent, key: InputStats.famePercentage.key)
            saveStats.saveData(self.flamePercent, key: InputStats.wingsPercentage.key)
            if validationForDiamonds(self.currentAchievementPoints.text) {
                saveStats.saveData(self.currentAchievementPoints.text, key: InputStats.currentAchievemntPoints.key)
            }
            if validationForDiamonds(self.currentFamePoints.text) {
                saveStats.saveData(self.currentFamePoints.text, key: InputStats.currentFamePoints.key)
            }
            if validationForDiamonds(self.currentFlamePoints.text) {
                saveStats.saveData(self.currentFlamePoints.text, key: InputStats.currentWingsPoints.key)
            }
        }
        self.deregisterFromNotifications()
    }
    
    func saveData(_ isActive: Bool, clas: Classes) {
        if !(self.amountOfDimanondsPerDay.text?.isEmpty)! && self.evaluateButton.isEnabled {
            saveStats.saveData(self.amountOfDimanondsPerDay.text, key: InputStats.diamondsPerDay.key)
            saveStats.saveData(self.achievementTitle.text, key: InputStats.achievementTitle.key)
            saveStats.saveData(self.fameTitle.text, key: InputStats.fameTitle.key)
            saveStats.saveData(self.wingsTitle.text, key: InputStats.wingsTitle.key)
            saveStats.saveData(self.achievementPercent, key: InputStats.achievementPercentage.key)
            saveStats.saveData(self.famePercent, key: InputStats.famePercentage.key)
            saveStats.saveData(self.flamePercent, key: InputStats.wingsPercentage.key)
            if validationForDiamonds(self.currentAchievementPoints.text) {
                saveStats.saveData(self.currentAchievementPoints.text, key: InputStats.currentAchievemntPoints.key)
            }
            if validationForDiamonds(self.currentFamePoints.text) {
                saveStats.saveData(self.currentFamePoints.text, key: InputStats.currentFamePoints.key)
            }
            if validationForDiamonds(self.currentFlamePoints.text) {
                saveStats.saveData(self.currentFlamePoints.text, key: InputStats.currentWingsPoints.key)
            }
        }
        if isActive && clas == Classes.extra {
            self.resetViewControllerContent()
        }
    }
    
    private func resetViewControllerContent() {
        self.achievementViewHeightConstraint.constant = 0.0
        self.fameViewHeightConstraint.constant = 0.0
        self.wingsViewHeightConstraint.constant = 0.0
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: calculateHeightOfScreen())
        self.achievementsView.isHidden = true
        self.famesView.isHidden = true
        self.wingsView.isHidden = true
    }
    
    private func calculateHeightOfScreen() -> CGFloat {
        var constant: CGFloat = 0.0

        if UIDevice.current.userInterfaceIdiom == .pad {
            constant = 20
        } else {
            constant = 10
        }
        
        let totalHeight = self.enterStatsView.frame.height + self.achievementViewHeightConstraint.constant + self.fameViewHeightConstraint.constant + self.wingsViewHeightConstraint.constant + constant
        return totalHeight
    }
    
    private func validateCurrentPoints(whoIs: Types, title: String, currentPoints: Int) -> String {
        switch whoIs {
        case .AchievementBadge:
            if currentPoints >= Achievement().evaluatePointsForTitle(currentTitle: title) {
                return String(Achievement().evaluatePointsForTitle(currentTitle: title))
            } else {
                return String(currentPoints)
            }
        case .FameBadge:
            if currentPoints >= Fame().evaluatePointsForTitle(currentTitle: title) {
                return String(Fame().evaluatePointsForTitle(currentTitle: title))
            } else {
                return String(currentPoints)
            }
        case .CondorFlame:
            if currentPoints >= Wing().evaluatePointsForTitle(currentTitle: title) {
                return String(Wing().evaluatePointsForTitle(currentTitle: title))
            } else {
                return String(currentPoints)
            }
        }
    }
    
    private func evaluateStats(which: Types) {
        var spacer: CGFloat = 30.0
        
        switch which {
        case .AchievementBadge:
            let achievement = Achievement()
            let arrayOfAchievements = achievement.recalculatePoints(currentTitle: self.achievementTitle.text!, currentPoints: Int(self.currentAchievementPoints.text!)!)
            for (title, values) in arrayOfAchievements {
                let titleName = LabelOrangeColorClass(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
                titleName.center = CGPoint(x: 70.0, y: 0.0 + spacer)
                titleName.textAlignment = NSTextAlignment.left
                titleName.text = title
                self.achievementsView.addSubview(titleName)
                
                let value = LabelOrangeColorClass(frame: CGRect(x: 200.0, y: 0.0, width: 120.0, height: 30.0))
                value.center = CGPoint(x: self.achievementsView.frame.width - 70.0, y: 0.0 + spacer)
                value.textAlignment = NSTextAlignment.right
                value.text = ""
                let numberOfDays = Day(type: .AchievementBadge, points: values, diamondsPerDay: Int(self.amountOfDimanondsPerDay.text!)!).evaluateDays(percentage: self.achievementSlider.value)
                if numberOfDays == 1 {
                    value.text = String(numberOfDays) + " day"
                } else {
                    value.text = String(numberOfDays) + " days"
                }
                self.achievementsView.addSubview(value)
                
                spacer = spacer + 30
            }
            self.achievementViewHeightConstraint.constant = spacer
        case .FameBadge:
            let fame = Fame()
            let arrayOfFames = fame.recalculatePoints(currentTitle: self.fameTitle.text!, currentPoints: Int(self.currentFamePoints.text!)!)
            for (title, values) in arrayOfFames {
                let titleName = LabelOrangeColorClass(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
                titleName.center = CGPoint(x: 70.0, y: 0.0 + spacer)
                titleName.textAlignment = NSTextAlignment.left
                titleName.text = title
                self.famesView.addSubview(titleName)
                
                let value = LabelOrangeColorClass(frame: CGRect(x: 200.0, y: 0.0, width: 120.0, height: 30.0))
                value.center = CGPoint(x: self.famesView.frame.width - 70.0, y: 0.0 + spacer)
                value.textAlignment = NSTextAlignment.right
                let numberOfDays = Day(type: .FameBadge, points: values, diamondsPerDay: Int(self.amountOfDimanondsPerDay.text!)!).evaluateDays(percentage: Float(self.famePercent))
                if numberOfDays == 1 {
                    value.text = String(numberOfDays) + " day"
                } else {
                    value.text = String(numberOfDays) + " days"
                }
                self.famesView.addSubview(value)
                
                spacer = spacer + 30
            }
            self.fameViewHeightConstraint.constant = spacer
        case .CondorFlame:
            let wing = Wing()
            let arrayOfFlames = wing.recalculatePoints(currentTitle: self.wingsTitle.text!, currentPoints: Int(self.currentFlamePoints.text!)!)
            
            for (title, values) in arrayOfFlames {
                let titleName = LabelOrangeColorClass(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
                titleName.center = CGPoint(x: 70.0, y: 0.0 + spacer)
                titleName.textAlignment = NSTextAlignment.left
                titleName.text = title
                self.wingsView.addSubview(titleName)
                
                let value = LabelOrangeColorClass(frame: CGRect(x: 200.0, y: 0.0, width: 120.0, height: 30.0))
                value.center = CGPoint(x: self.wingsView.frame.width - 70.0, y: 0.0 + spacer)
                value.textAlignment = NSTextAlignment.right
                let numberOfDays = Day(type: .CondorFlame, points: values, diamondsPerDay: Int(self.amountOfDimanondsPerDay.text!)!).evaluateDays(percentage: Float(self.flamePercent))
                if numberOfDays == 1 {
                    value.text = String(numberOfDays) + " day"
                } else {
                    value.text = String(numberOfDays) + " days"
                }
                self.wingsView.addSubview(value)
                
                spacer = spacer + 30
            }
            self.wingsViewHeightConstraint.constant = spacer
        }
    }
    
    @IBAction func evaluateAchievements(_ sender: UISlider) {
        self.achievementPercent = Int(round(sender.value))
        
        if self.achievementPercent + self.famePercent + self.flamePercent >= self.maxPercent {
            self.achievementSlider.maximumValue = Float(self.achievementPercent)
        } else {
            self.achievementSlider.maximumValue = Float(self.maxPercent - self.famePercent - self.flamePercent)
        }
        
        if self.achievementPercent != 0 {
            self.maxNumberOfAchievements.text = String(self.achievementPercent)
        } else {
            self.maxNumberOfAchievements.text = String(Int(self.achievementSlider.maximumValue))
        }
        
        if (self.achievementPercent != 0 || self.famePercent != 0 || self.flamePercent != 0) {
            self.evaluateButton.isEnabled = true
        } else {
            self.evaluateButton.isEnabled = false
        }
    }
    
    @IBAction func evaluateFames(_ sender: UISlider) {
        self.famePercent = Int(round(sender.value))
        
        if self.achievementPercent + self.famePercent + self.flamePercent >= self.maxPercent {
            self.fameSlider.maximumValue = Float(self.famePercent)
        } else {
            self.fameSlider.maximumValue = Float(self.maxPercent - self.achievementPercent - self.flamePercent)
        }
        
        if self.famePercent != 0 {
            self.maxNumberOfFames.text = String(self.famePercent)
        } else {
            self.maxNumberOfFames.text = String(Int(self.fameSlider.maximumValue))
        }
        
        if (self.achievementPercent != 0 || self.famePercent != 0 || self.flamePercent != 0) {
            self.evaluateButton.isEnabled = true
        } else {
            self.evaluateButton.isEnabled = false
        }
    }
    
    @IBAction func evaluateWings(_ sender: UISlider) {
        self.flamePercent = Int(round(sender.value))
        
        if self.achievementPercent + self.famePercent + self.flamePercent >= self.maxPercent {
            self.flameSlider.maximumValue = Float(self.flamePercent)
        } else {
            self.flameSlider.maximumValue = Float(self.maxPercent - self.achievementPercent - self.famePercent)
        }
        
        if self.flamePercent != 0 {
            self.maxNumberOfFlames.text = String(self.flamePercent)
        } else {
            self.maxNumberOfFlames.text = String(Int(self.flameSlider.maximumValue))
        }
        
        if (self.achievementPercent != 0 || self.famePercent != 0 || self.flamePercent != 0) {
            self.evaluateButton.isEnabled = true
        } else {
            self.evaluateButton.isEnabled = false
        }
    }
    
    @IBAction func evaluateButton(_ sender: Any) {
        self.achievementsView.subviews.forEach({ $0.removeFromSuperview() })
        self.famesView.subviews.forEach({ $0.removeFromSuperview() })
        self.wingsView.subviews.forEach({ $0.removeFromSuperview() })
        
        if (self.currentAchievementPoints.text?.isEmpty)! && self.achievementPercent != 0 {
            self.currentAchievementPoints.text = "0"
        }
        if (self.currentFamePoints.text?.isEmpty)! && self.famePercent != 0 {
            self.currentFamePoints.text = "0"
        }
        if (self.currentFlamePoints.text?.isEmpty)! && self.flamePercent != 0 {
            self.currentFlamePoints.text = "0"
        }
        
        if (self.achievementTitle.text?.isEmpty)! || (self.currentAchievementPoints.text?.isEmpty)! || !self.validationForDiamonds(self.currentAchievementPoints.text) || self.achievementSlider.value == 0 {
            self.achievementsView.isHidden = true
            self.achievementViewHeightConstraint.constant = 0.0
        } else {
            self.achievementsView.isHidden = false
            self.evaluateStats(which: .AchievementBadge)
        }
        
        if (self.fameTitle.text?.isEmpty)! || (self.currentFamePoints.text?.isEmpty)! || !self.validationForDiamonds(self.currentFamePoints.text) || self.fameSlider.value == 0 {
            self.famesView.isHidden = true
            self.fameViewHeightConstraint.constant = 0.0
        } else {
            self.famesView.isHidden = false
            self.evaluateStats(which: .FameBadge)
        }
        
        if (self.wingsTitle.text?.isEmpty)! || (self.currentFlamePoints.text?.isEmpty)! || !self.validationForDiamonds(self.currentFlamePoints.text) || self.flameSlider.value == 0 {
            self.wingsView.isHidden = true
            self.wingsViewHeightConstraint.constant = 0.0
        } else {
            self.wingsView.isHidden = false
            self.evaluateStats(which: .CondorFlame)
        }
        
        let scrollViewHeight = self.calculateHeightOfScreen()
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: scrollViewHeight)
    }
    
    private func makeTextFieldEditable(_ isEdidable: Bool) {
        self.achievementSlider.isEnabled = isEdidable
        self.fameSlider.isEnabled = isEdidable
        self.flameSlider.isEnabled = isEdidable
        self.achievementTitle.isEnabled = isEdidable
        self.fameTitle.isEnabled = isEdidable
        self.wingsTitle.isEnabled = isEdidable
        self.currentAchievementPoints.isEnabled = isEdidable
        self.currentFamePoints.isEnabled = isEdidable
        self.currentFlamePoints.isEnabled = isEdidable
        
        if isEdidable {
            self.achievementTitle.textColor = UIColor.orange.withAlphaComponent(1.0)
            self.fameTitle.textColor = UIColor.orange.withAlphaComponent(1.0)
            self.wingsTitle.textColor = UIColor.orange.withAlphaComponent(1.0)
            self.currentAchievementPoints.textColor = UIColor.orange.withAlphaComponent(1.0)
            self.currentFamePoints.textColor = UIColor.orange.withAlphaComponent(1.0)
            self.currentFlamePoints.textColor = UIColor.orange.withAlphaComponent(1.0)
        } else {
            self.achievementTitle.textColor = UIColor.orange.withAlphaComponent(0.3)
            self.fameTitle.textColor = UIColor.orange.withAlphaComponent(0.3)
            self.wingsTitle.textColor = UIColor.orange.withAlphaComponent(0.3)
            self.currentAchievementPoints.textColor = UIColor.orange.withAlphaComponent(0.3)
            self.currentFamePoints.textColor = UIColor.orange.withAlphaComponent(0.3)
            self.currentFlamePoints.textColor = UIColor.orange.withAlphaComponent(0.3)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.achievementTitle.isFirstResponder {
            return Achievements.titlesArray.count - 1
        } else if self.fameTitle.isFirstResponder {
            return Fames.titlesArray.count - 1
        } else if self.wingsTitle.isFirstResponder {
            return Wings.titlesArray.count - 1
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.achievementTitle.isFirstResponder {
            return Achievements.titlesArray[row]
        }
        if self.fameTitle.isFirstResponder {
            return Fames.titlesArray[row]
        }
        if self.wingsTitle.isFirstResponder {
            return Wings.titlesArray[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.achievementTitle.isFirstResponder {
            self.achievementTitle.text = Achievements.titlesArray[row]
        }
        if self.fameTitle.isFirstResponder {
            self.fameTitle.text = Fames.titlesArray[row]
        }
        if self.wingsTitle.isFirstResponder {
            self.wingsTitle.text = Wings.titlesArray[row]
        }
    }
    
    func endEdit(_ sedner: UIGestureRecognizer) {
        self.enterStatsView.endEditing(true)
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
            self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
            self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
        }
    }
    
    func FieldDidChange(textField: UITextField) {
        if !(self.amountOfDimanondsPerDay.text?.isEmpty)! && validationForDiamonds(self.amountOfDimanondsPerDay.text) {
            self.makeTextFieldEditable(true)
            self.evaluateButton.isEnabled = true
        } else {
            self.makeTextFieldEditable(false)
            self.evaluateButton.isEnabled = false
        }
        
        if (!self.achievementSlider.isEnabled || !self.fameSlider.isEnabled || !self.flameSlider.isEnabled) {
            self.evaluateButton.isEnabled = false
        } else {
            self.evaluateButton.isEnabled = true
        }
        
        if (validationForDiamonds(self.amountOfDimanondsPerDay.text) && !(self.achievementTitle.text?.isEmpty)! && self.achievementPercent != 0 && self.validationForDiamonds(self.currentAchievementPoints.text)) || (validationForDiamonds(self.amountOfDimanondsPerDay.text) && !(self.fameTitle.text?.isEmpty)! && self.famePercent != 0 && self.validationForDiamonds(self.currentFamePoints.text)) || (validationForDiamonds(self.amountOfDimanondsPerDay.text) && !(self.wingsTitle.text?.isEmpty)! && self.flamePercent != 0 && self.validationForDiamonds(self.currentFlamePoints.text)) {
            self.evaluateButton.isEnabled = true
        } else {
            self.evaluateButton.isEnabled = false
        }
        
        if !(self.currentAchievementPoints.text?.isEmpty)! && !(self.achievementTitle.text?.isEmpty)! {
            self.currentAchievementPoints.text = self.validateCurrentPoints(whoIs: .AchievementBadge, title: self.achievementTitle.text!, currentPoints: Int(self.currentAchievementPoints.text!)!)
        }
        
        if !(self.currentFamePoints.text?.isEmpty)! && !(self.fameTitle.text?.isEmpty)! {
            self.currentFamePoints.text = self.validateCurrentPoints(whoIs: .FameBadge, title: self.fameTitle.text!, currentPoints: Int(self.currentFamePoints.text!)!)
        }
        
        if !(self.currentFlamePoints.text?.isEmpty)! && !(self.wingsTitle.text?.isEmpty)! {
            self.currentFlamePoints.text = self.validateCurrentPoints(whoIs: .CondorFlame, title: self.wingsTitle.text!, currentPoints: Int(self.currentFlamePoints.text!)!)
        }
    }
    
    func resetView(){
        self.resignFirstResponder()
        self.closekeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.amountOfDimanondsPerDay.keyboardType = .numberPad
        self.currentAchievementPoints.keyboardType = .numberPad
        self.currentFamePoints.keyboardType = .numberPad
        self.currentFlamePoints.keyboardType = .numberPad
        
        if self.achievementTitle.isFirstResponder {
            self.achievementTitle.isEnabled = true
            self.fameTitle.isEnabled = false
            self.wingsTitle.isEnabled = false
        }
        if self.fameTitle.isFirstResponder {
            self.achievementTitle.isEnabled = false
            self.fameTitle.isEnabled = true
            self.wingsTitle.isEnabled = false
        }
        if self.wingsTitle.isFirstResponder {
            self.achievementTitle.isEnabled = false
            self.fameTitle.isEnabled = false
            self.wingsTitle.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.amountOfDimanondsPerDay.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(self.amountOfDimanondsPerDay.text?.isEmpty)! && self.amountOfDimanondsPerDay.text != "0" && self.validationForDiamonds(self.amountOfDimanondsPerDay.text){
            self.makeTextFieldEditable(true)
        } else {
            self.makeTextFieldEditable(false)
            self.achievementsView.isHidden = true
            self.famesView.isHidden = true
            self.wingsView.isHidden = true
        }
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
    
    func validationForDiamonds(_ enteredData: String?) -> Bool {
        guard let enteredData = enteredData else {
            return false
        }
        
        let format = "[0-9]{1,9}"
        let formatPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return formatPredicate.evaluate(with: enteredData)
    }
}
