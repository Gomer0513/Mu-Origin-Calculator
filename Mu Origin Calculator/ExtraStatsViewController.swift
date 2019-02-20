//
//  ExtraStatsViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 8/9/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import UIKit

class ExtraStatsViewController: UIViewController {

    // MARK: - IBOutlets
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
    fileprivate var achievementPercent = 0
    fileprivate var famePercent = 0
    fileprivate var flamePercent = 0
    fileprivate var maxPercent = 100
    fileprivate var achievement: Day!
    fileprivate var fame: Day!
    fileprivate var flame: Day!
    var iPadViewController: IPadViewController?
    
    // MARK: - Constants
    fileprivate let saveStats = SaveStats(character: Classes.extra.rawValue)
    
    // MARK: - IBAction
    @IBAction func evaluateAchievements(_ sender: UISlider) {
        achievementPercent = Int(round(sender.value))
        
        if achievementPercent + famePercent + flamePercent >= maxPercent {
            achievementSlider.maximumValue = Float(achievementPercent)
        } else {
            achievementSlider.maximumValue = Float(maxPercent - famePercent - flamePercent)
        }
        
        if achievementPercent != 0 {
            maxNumberOfAchievements.text = String(achievementPercent)
        } else {
            maxNumberOfAchievements.text = String(Int(achievementSlider.maximumValue))
        }
        
        if (achievementPercent != 0 || famePercent != 0 || flamePercent != 0) {
            evaluateButton.isEnabled = true
        } else {
            evaluateButton.isEnabled = false
        }
    }
    
    @IBAction func evaluateFames(_ sender: UISlider) {
        famePercent = Int(round(sender.value))
        
        if achievementPercent + famePercent + flamePercent >= maxPercent {
            fameSlider.maximumValue = Float(famePercent)
        } else {
            fameSlider.maximumValue = Float(maxPercent - achievementPercent - flamePercent)
        }
        
        if famePercent != 0 {
            maxNumberOfFames.text = String(famePercent)
        } else {
            maxNumberOfFames.text = String(Int(fameSlider.maximumValue))
        }
        
        if (achievementPercent != 0 || famePercent != 0 || flamePercent != 0) {
            evaluateButton.isEnabled = true
        } else {
            evaluateButton.isEnabled = false
        }
    }
    
    @IBAction func evaluateWings(_ sender: UISlider) {
        flamePercent = Int(round(sender.value))
        
        if achievementPercent + famePercent + flamePercent >= maxPercent {
            flameSlider.maximumValue = Float(flamePercent)
        } else {
            flameSlider.maximumValue = Float(maxPercent - achievementPercent - famePercent)
        }
        
        if flamePercent != 0 {
            maxNumberOfFlames.text = String(flamePercent)
        } else {
            maxNumberOfFlames.text = String(Int(flameSlider.maximumValue))
        }
        
        if (achievementPercent != 0 || famePercent != 0 || flamePercent != 0) {
            evaluateButton.isEnabled = true
        } else {
            evaluateButton.isEnabled = false
        }
    }
    
    @IBAction func evaluateButton(_ sender: Any) {
        achievementsView.subviews.forEach({ $0.removeFromSuperview() })
        famesView.subviews.forEach({ $0.removeFromSuperview() })
        wingsView.subviews.forEach({ $0.removeFromSuperview() })
        
        if (currentAchievementPoints.text?.isEmpty)! && achievementPercent != 0 {
            currentAchievementPoints.text = "0"
        }
        if (currentFamePoints.text?.isEmpty)! && famePercent != 0 {
            currentFamePoints.text = "0"
        }
        if (currentFlamePoints.text?.isEmpty)! && flamePercent != 0 {
            currentFlamePoints.text = "0"
        }
        
        if (achievementTitle.text?.isEmpty)! || (currentAchievementPoints.text?.isEmpty)! || !StatsValidation.forDiamonds(currentAchievementPoints.text) || achievementSlider.value == 0 {
            achievementsView.isHidden = true
            achievementViewHeightConstraint.constant = 0.0
        } else {
            achievementsView.isHidden = false
            evaluateStats(which: .AchievementBadge)
        }
        
        if (fameTitle.text?.isEmpty)! || (currentFamePoints.text?.isEmpty)! || !StatsValidation.forDiamonds(currentFamePoints.text) || fameSlider.value == 0 {
            famesView.isHidden = true
            fameViewHeightConstraint.constant = 0.0
        } else {
            famesView.isHidden = false
            evaluateStats(which: .FameBadge)
        }
        
        if (wingsTitle.text?.isEmpty)! || (currentFlamePoints.text?.isEmpty)! || !StatsValidation.forDiamonds(currentFlamePoints.text) || flameSlider.value == 0 {
            wingsView.isHidden = true
            wingsViewHeightConstraint.constant = 0.0
        } else {
            wingsView.isHidden = false
            evaluateStats(which: .CondorFlame)
        }
        
        let scrollViewHeight = calculateHeightOfScreen()
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollViewHeight)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        loadData()
        
        if !(amountOfDimanondsPerDay.text?.isEmpty)! {
            makeTextFieldEditable(true)
            if achievementSlider.value != 0 {
                achievementSlider.maximumValue = Float(maxPercent) - fameSlider.value - flameSlider.value
                maxNumberOfAchievements.text = String(Int(achievementSlider.maximumValue))
            }
            if fameSlider.value != 0 {
                fameSlider.maximumValue = Float(maxPercent) - achievementSlider.value - flameSlider.value
                maxNumberOfFames.text = String(Int(fameSlider.maximumValue))
            }
            if flameSlider.value != 0 {
                flameSlider.maximumValue = Float(maxPercent) - achievementSlider.value - fameSlider.value
                maxNumberOfFlames.text = String(Int(flameSlider.maximumValue))
            }
        }
        
        amountOfDimanondsPerDay.delegate = self
        amountOfDimanondsPerDay.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        
        achievementTitle.delegate = self
        achievementTitle.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        fameTitle.delegate = self
        fameTitle.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        wingsTitle.delegate = self
        wingsTitle.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        currentAchievementPoints.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        currentFamePoints.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        currentFlamePoints.addTarget(self, action: #selector(FieldDidChange(textField:)), for: .editingDidEnd)
        
        let tapper = UITapGestureRecognizer(target: self, action: #selector(endEdit(_:)))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
        
        if let ipad = iPadViewController {
            ipad.extraStatsDelegate = self
        }
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        achievementTitle.inputView = pickerView
        fameTitle.inputView = pickerView
        wingsTitle.inputView = pickerView
        
        registerForNotifications()
    }
    
    deinit {
        if !(amountOfDimanondsPerDay.text?.isEmpty)! && evaluateButton.isEnabled {
            saveStats.saveData(amountOfDimanondsPerDay.text, key: InputStats.diamondsPerDay.key)
            saveStats.saveData(achievementTitle.text, key: InputStats.achievementTitle.key)
            saveStats.saveData(fameTitle.text, key: InputStats.fameTitle.key)
            saveStats.saveData(wingsTitle.text, key: InputStats.wingsTitle.key)
            saveStats.saveData(achievementPercent, key: InputStats.achievementPercentage.key)
            saveStats.saveData(famePercent, key: InputStats.famePercentage.key)
            saveStats.saveData(flamePercent, key: InputStats.wingsPercentage.key)
            if StatsValidation.forDiamonds(currentAchievementPoints.text) {
                saveStats.saveData(currentAchievementPoints.text, key: InputStats.currentAchievemntPoints.key)
            }
            if StatsValidation.forDiamonds(currentFamePoints.text) {
                saveStats.saveData(currentFamePoints.text, key: InputStats.currentFamePoints.key)
            }
            if StatsValidation.forDiamonds(currentFlamePoints.text) {
                saveStats.saveData(currentFlamePoints.text, key: InputStats.currentWingsPoints.key)
            }
        }
        deregisterFromNotifications()
    }
    
    //MARK: - Methods
    
    private func loadData() {
        amountOfDimanondsPerDay.text = saveStats.getData(key: InputStats.diamondsPerDay.key)
        achievementTitle.text = saveStats.getData(key: InputStats.achievementTitle.key)
        fameTitle.text = saveStats.getData(key: InputStats.fameTitle.key)
        wingsTitle.text = saveStats.getData(key: InputStats.wingsTitle.key)
        currentAchievementPoints.text = saveStats.getData(key: InputStats.currentAchievemntPoints.key)
        currentFamePoints.text = saveStats.getData(key: InputStats.currentFamePoints.key)
        currentFlamePoints.text = saveStats.getData(key: InputStats.currentWingsPoints.key)
        achievementSlider.value = saveStats.getData(key: InputStats.achievementPercentage.key)
        fameSlider.value = saveStats.getData(key: InputStats.famePercentage.key)
        flameSlider.value = saveStats.getData(key: InputStats.wingsPercentage.key)
    }
    
    private func initialSetup() {
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.title = subject
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!]
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)!], for: .normal)
        scrollView.backgroundColor = backgroundColor.withAlphaComponent(0.90)
        containerView.backgroundColor = backgroundColor.withAlphaComponent(0)
        enterStatsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        achievementsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        famesView.backgroundColor = backgroundColor.withAlphaComponent(0)
        wingsView.backgroundColor = backgroundColor.withAlphaComponent(0)
        amountOfDimanondsPerDay.attributedPlaceholder = NSAttributedString(string: amountOfDimanondsPerDay.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
        
        evaluateButton.setTitle("Calculate", for: .normal)
        
        evaluateButton.isEnabled = false
        makeTextFieldEditable(false)
        
        achievementsView.isHidden = true
        famesView.isHidden = true
        wingsView.isHidden = true
    }
    
    fileprivate func resetViewControllerContent() {
        achievementViewHeightConstraint.constant = 0.0
        fameViewHeightConstraint.constant = 0.0
        wingsViewHeightConstraint.constant = 0.0
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: calculateHeightOfScreen())
        achievementsView.isHidden = true
        famesView.isHidden = true
        wingsView.isHidden = true
    }
    
    private func calculateHeightOfScreen() -> CGFloat {
        var constant: CGFloat = 0.0
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            constant = 20
        } else {
            constant = 10
        }
        
        let totalHeight = enterStatsView.frame.height + achievementViewHeightConstraint.constant + fameViewHeightConstraint.constant + wingsViewHeightConstraint.constant + constant
        return totalHeight
    }
    
    fileprivate func validateCurrentPoints(whoIs: Types, title: String, currentPoints: Int) -> String {
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
            let arrayOfAchievements = achievement.recalculatePoints(currentTitle: achievementTitle.text!, currentPoints: Int(currentAchievementPoints.text!)!)
            for (title, values) in arrayOfAchievements {
                let titleName = LabelOrangeColorClass(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
                titleName.center = CGPoint(x: 70.0, y: 0.0 + spacer)
                titleName.textAlignment = NSTextAlignment.left
                titleName.text = title
                achievementsView.addSubview(titleName)
                
                let value = LabelOrangeColorClass(frame: CGRect(x: 200.0, y: 0.0, width: 120.0, height: 30.0))
                value.center = CGPoint(x: achievementsView.frame.width - 70.0, y: 0.0 + spacer)
                value.textAlignment = NSTextAlignment.right
                value.text = ""
                let numberOfDays = Day(type: .AchievementBadge, points: values, diamondsPerDay: Int(amountOfDimanondsPerDay.text!)!).evaluateDays(percentage: achievementSlider.value)
                if numberOfDays == 1 {
                    value.text = String(numberOfDays) + " day"
                } else {
                    value.text = String(numberOfDays) + " days"
                }
                achievementsView.addSubview(value)
                
                spacer = spacer + 30
            }
            achievementViewHeightConstraint.constant = spacer
        case .FameBadge:
            let fame = Fame()
            let arrayOfFames = fame.recalculatePoints(currentTitle: fameTitle.text!, currentPoints: Int(currentFamePoints.text!)!)
            for (title, values) in arrayOfFames {
                let titleName = LabelOrangeColorClass(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
                titleName.center = CGPoint(x: 70.0, y: 0.0 + spacer)
                titleName.textAlignment = NSTextAlignment.left
                titleName.text = title
                famesView.addSubview(titleName)
                
                let value = LabelOrangeColorClass(frame: CGRect(x: 200.0, y: 0.0, width: 120.0, height: 30.0))
                value.center = CGPoint(x: famesView.frame.width - 70.0, y: 0.0 + spacer)
                value.textAlignment = NSTextAlignment.right
                let numberOfDays = Day(type: .FameBadge, points: values, diamondsPerDay: Int(amountOfDimanondsPerDay.text!)!).evaluateDays(percentage: Float(famePercent))
                if numberOfDays == 1 {
                    value.text = String(numberOfDays) + " day"
                } else {
                    value.text = String(numberOfDays) + " days"
                }
                famesView.addSubview(value)
                
                spacer = spacer + 30
            }
            fameViewHeightConstraint.constant = spacer
        case .CondorFlame:
            let wing = Wing()
            let arrayOfFlames = wing.recalculatePoints(currentTitle: wingsTitle.text!, currentPoints: Int(currentFlamePoints.text!)!)
            
            for (title, values) in arrayOfFlames {
                let titleName = LabelOrangeColorClass(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
                titleName.center = CGPoint(x: 70.0, y: 0.0 + spacer)
                titleName.textAlignment = NSTextAlignment.left
                titleName.text = title
                wingsView.addSubview(titleName)
                
                let value = LabelOrangeColorClass(frame: CGRect(x: 200.0, y: 0.0, width: 120.0, height: 30.0))
                value.center = CGPoint(x: wingsView.frame.width - 70.0, y: 0.0 + spacer)
                value.textAlignment = NSTextAlignment.right
                let numberOfDays = Day(type: .CondorFlame, points: values, diamondsPerDay: Int(amountOfDimanondsPerDay.text!)!).evaluateDays(percentage: Float(flamePercent))
                if numberOfDays == 1 {
                    value.text = String(numberOfDays) + " day"
                } else {
                    value.text = String(numberOfDays) + " days"
                }
                wingsView.addSubview(value)
                
                spacer = spacer + 30
            }
            wingsViewHeightConstraint.constant = spacer
        }
    }
    
    fileprivate func makeTextFieldEditable(_ isEdidable: Bool) {
        achievementSlider.isEnabled = isEdidable
        fameSlider.isEnabled = isEdidable
        flameSlider.isEnabled = isEdidable
        achievementTitle.isEnabled = isEdidable
        fameTitle.isEnabled = isEdidable
        wingsTitle.isEnabled = isEdidable
        currentAchievementPoints.isEnabled = isEdidable
        currentFamePoints.isEnabled = isEdidable
        currentFlamePoints.isEnabled = isEdidable
        
        if isEdidable {
            achievementTitle.textColor = UIColor.orange.withAlphaComponent(1.0)
            achievementTitle.attributedPlaceholder = NSAttributedString(string: achievementTitle.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
            fameTitle.textColor = UIColor.orange.withAlphaComponent(1.0)
            fameTitle.attributedPlaceholder = NSAttributedString(string: fameTitle.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
            wingsTitle.textColor = UIColor.orange.withAlphaComponent(1.0)
            wingsTitle.attributedPlaceholder = NSAttributedString(string: wingsTitle.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
            currentAchievementPoints.textColor = UIColor.orange.withAlphaComponent(1.0)
            currentAchievementPoints.attributedPlaceholder = NSAttributedString(string: currentAchievementPoints.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
            currentFamePoints.textColor = UIColor.orange.withAlphaComponent(1.0)
            currentFamePoints.attributedPlaceholder = NSAttributedString(string: currentFamePoints.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
            currentFlamePoints.textColor = UIColor.orange.withAlphaComponent(1.0)
            currentFlamePoints.attributedPlaceholder = NSAttributedString(string: currentFlamePoints.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(1.0)])
        } else {
            achievementTitle.textColor = UIColor.orange.withAlphaComponent(0.3)
            achievementTitle.attributedPlaceholder = NSAttributedString(string: achievementTitle.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
            fameTitle.textColor = UIColor.orange.withAlphaComponent(0.3)
            fameTitle.attributedPlaceholder = NSAttributedString(string: fameTitle.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
            wingsTitle.textColor = UIColor.orange.withAlphaComponent(0.3)
            wingsTitle.attributedPlaceholder = NSAttributedString(string: wingsTitle.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
            currentAchievementPoints.textColor = UIColor.orange.withAlphaComponent(0.3)
            currentAchievementPoints.attributedPlaceholder = NSAttributedString(string: currentAchievementPoints.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
            currentFamePoints.textColor = UIColor.orange.withAlphaComponent(0.3)
            currentFamePoints.attributedPlaceholder = NSAttributedString(string: currentFamePoints.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
            currentFlamePoints.textColor = UIColor.orange.withAlphaComponent(0.3)
            currentFlamePoints.attributedPlaceholder = NSAttributedString(string: currentFlamePoints.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.orange.withAlphaComponent(0.3)])
        }
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
            scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
            scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0,  0.0)
        }
    }
}

// MARK: - UIPickerViewDelegate

extension ExtraStatsViewController: UIPickerViewDelegate {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if achievementTitle.isFirstResponder {
            return Achievements.titlesArray.count - 1
        } else if fameTitle.isFirstResponder {
            return Fames.titlesArray.count - 1
        } else if wingsTitle.isFirstResponder {
            return Wings.titlesArray.count - 1
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if achievementTitle.isFirstResponder {
            return Achievements.titlesArray[row]
        }
        if fameTitle.isFirstResponder {
            return Fames.titlesArray[row]
        }
        if wingsTitle.isFirstResponder {
            return Wings.titlesArray[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if achievementTitle.isFirstResponder {
            achievementTitle.text = Achievements.titlesArray[row]
        }
        if fameTitle.isFirstResponder {
            fameTitle.text = Fames.titlesArray[row]
        }
        if wingsTitle.isFirstResponder {
            wingsTitle.text = Wings.titlesArray[row]
        }
    }
}

// MARK: - UITextFieldDelegate

extension ExtraStatsViewController: UITextFieldDelegate {
    
    func endEdit(_ sedner: UIGestureRecognizer) {
        enterStatsView.endEditing(true)
    }
    
    func FieldDidChange(textField: UITextField) {
        if !(amountOfDimanondsPerDay.text?.isEmpty)! && StatsValidation.forDiamonds(amountOfDimanondsPerDay.text) {
            makeTextFieldEditable(true)
            evaluateButton.isEnabled = true
        } else {
            makeTextFieldEditable(false)
            evaluateButton.isEnabled = false
        }
        
        if (!achievementSlider.isEnabled || !fameSlider.isEnabled || !flameSlider.isEnabled) {
            evaluateButton.isEnabled = false
        } else {
            evaluateButton.isEnabled = true
        }
        
        if (StatsValidation.forDiamonds(amountOfDimanondsPerDay.text) && !(achievementTitle.text?.isEmpty)! && achievementPercent != 0 && StatsValidation.forDiamonds(currentAchievementPoints.text)) || (StatsValidation.forDiamonds(amountOfDimanondsPerDay.text) && !(fameTitle.text?.isEmpty)! && famePercent != 0 && StatsValidation.forDiamonds(currentFamePoints.text)) || (StatsValidation.forDiamonds(amountOfDimanondsPerDay.text) && !(wingsTitle.text?.isEmpty)! && flamePercent != 0 && StatsValidation.forDiamonds(currentFlamePoints.text)) {
            evaluateButton.isEnabled = true
        } else {
            evaluateButton.isEnabled = false
        }
        
        if !(currentAchievementPoints.text?.isEmpty)! && !(achievementTitle.text?.isEmpty)! {
            currentAchievementPoints.text = validateCurrentPoints(whoIs: .AchievementBadge, title: achievementTitle.text!, currentPoints: Int(currentAchievementPoints.text!)!)
        }
        
        if !(currentFamePoints.text?.isEmpty)! && !(fameTitle.text?.isEmpty)! {
            currentFamePoints.text = validateCurrentPoints(whoIs: .FameBadge, title: fameTitle.text!, currentPoints: Int(currentFamePoints.text!)!)
        }
        
        if !(currentFlamePoints.text?.isEmpty)! && !(wingsTitle.text?.isEmpty)! {
            currentFlamePoints.text = validateCurrentPoints(whoIs: .CondorFlame, title: wingsTitle.text!, currentPoints: Int(currentFlamePoints.text!)!)
        }
    }
    
    func resetView(){
        resignFirstResponder()
        closekeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        amountOfDimanondsPerDay.keyboardType = .numberPad
        currentAchievementPoints.keyboardType = .numberPad
        currentFamePoints.keyboardType = .numberPad
        currentFlamePoints.keyboardType = .numberPad
        
        if achievementTitle.isFirstResponder {
            achievementTitle.isEnabled = true
            fameTitle.isEnabled = false
            wingsTitle.isEnabled = false
        }
        if fameTitle.isFirstResponder {
            achievementTitle.isEnabled = false
            fameTitle.isEnabled = true
            wingsTitle.isEnabled = false
        }
        if wingsTitle.isFirstResponder {
            achievementTitle.isEnabled = false
            fameTitle.isEnabled = false
            wingsTitle.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        amountOfDimanondsPerDay.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(amountOfDimanondsPerDay.text?.isEmpty)! && amountOfDimanondsPerDay.text != "0" && StatsValidation.forDiamonds(amountOfDimanondsPerDay.text){
            makeTextFieldEditable(true)
        } else {
            makeTextFieldEditable(false)
            achievementsView.isHidden = true
            famesView.isHidden = true
            wingsView.isHidden = true
        }
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

extension ExtraStatsViewController: SaveDataDelegate {
    func saveData(_ isActive: Bool, clas: Classes) {
        if !(amountOfDimanondsPerDay.text?.isEmpty)! && evaluateButton.isEnabled {
            saveStats.saveData(amountOfDimanondsPerDay.text, key: InputStats.diamondsPerDay.key)
            saveStats.saveData(achievementTitle.text, key: InputStats.achievementTitle.key)
            saveStats.saveData(fameTitle.text, key: InputStats.fameTitle.key)
            saveStats.saveData(wingsTitle.text, key: InputStats.wingsTitle.key)
            saveStats.saveData(achievementPercent, key: InputStats.achievementPercentage.key)
            saveStats.saveData(famePercent, key: InputStats.famePercentage.key)
            saveStats.saveData(flamePercent, key: InputStats.wingsPercentage.key)
            if StatsValidation.forDiamonds(currentAchievementPoints.text) {
                saveStats.saveData(currentAchievementPoints.text, key: InputStats.currentAchievemntPoints.key)
            }
            if StatsValidation.forDiamonds(currentFamePoints.text) {
                saveStats.saveData(currentFamePoints.text, key: InputStats.currentFamePoints.key)
            }
            if StatsValidation.forDiamonds(currentFlamePoints.text) {
                saveStats.saveData(currentFlamePoints.text, key: InputStats.currentWingsPoints.key)
            }
        }
        if isActive && clas == Classes.extra {
            resetViewControllerContent()
        }
    }
}
