//
//  MagicKnightViewController.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 7/11/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import UIKit

class MagicKnightViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var rebirthInput: UITextField!
    @IBOutlet weak var levelInput: UITextField!
    @IBOutlet weak var fruitStatsInput: UITextField!
    
    @IBOutlet weak var strField: UITextField!
    @IBOutlet weak var engField: UITextField!
    @IBOutlet weak var agiField: UITextField!
    @IBOutlet weak var staField: UITextField!
    
    @IBOutlet weak var totalStats: UILabel!
    @IBOutlet weak var statsWithoutCreatons: UILabel!
    
    @IBOutlet weak var showStatsView: UIView!
    @IBOutlet weak var inputStatsView: UIView!
    
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    
    //MARK: - Variables
    var character = Character()
    private var totalPoint = Int()
    private var points = Int()
    private var str = 0
    private var eng = 0
    private var agi = 0
    private var sta = 0
    
    // MARK: - Actions
    @IBAction func calculateButton(_ sender: Any) {
        
        self.character = Character(rebirth: Int(self.rebirthInput.text!), level: Int(self.levelInput.text!), fruits: Int(self.fruitStatsInput.text!))
        
        if self.showStatsView.isHidden {
            self.showStatsView.isHidden = false
        }
        if self.inputStatsView.isHidden {
            self.inputStatsView.isHidden = false
        }
        
        self.totalPoint = self.character.calculateFullStats()
        self.points = self.character.calculateStats()
        
        self.statsWithoutCreatons.text = String(self.points)
        self.totalStats.text = String(self.totalPoint)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showStatsView.isHidden = true
        self.inputStatsView.isHidden = true
        self.calculateButtonOutlet.isEnabled = false
        
        self.rebirthInput.delegate = self
        self.levelInput.delegate = self
        self.fruitStatsInput.delegate = self
        
        self.strField.delegate = self
        self.engField.delegate = self
        self.agiField.delegate = self
        self.staField.delegate = self
        
    }
    
    private func updateStats(_ textField: String?, stat: Stats) {
        
        if !((textField?.isEmpty)!) && validationForCreatons(textField) {
            if stat == .str {
                self.str = Int(textField!)!
                self.totalPoint = self.totalPoint - self.str
            }
            if stat == .eng {
                self.eng = Int(textField!)!
                self.totalPoint = self.totalPoint - self.eng
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
            self.totalPoint = self.character.calculateFullStats() - self.str - self.eng - self.agi - self.sta
            self.totalStats.text = String(self.totalPoint)
        }
        if (textField == "0" || (textField?.isEmpty)!) && stat == .eng {
            self.eng = 0
            self.totalPoint = self.character.calculateFullStats() - self.str - self.eng - self.agi - self.sta
            self.totalStats.text = String(self.totalPoint)
        }
        if (textField == "0" || (textField?.isEmpty)!) && stat == .agi {
            self.agi = 0
            self.totalPoint = self.character.calculateFullStats() - self.str - self.eng - self.agi - self.sta
            self.totalStats.text = String(self.totalPoint)
        }
        if (textField == "0" || (textField?.isEmpty)!) && stat == .sta {
            self.sta = 0
            self.totalPoint = self.character.calculateFullStats() - self.str - self.eng - self.agi - self.sta
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
        self.engField.keyboardType = .numberPad
        self.agiField.keyboardType = .numberPad
        self.staField.keyboardType = .numberPad
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.rebirthInput.resignFirstResponder()
        self.levelInput.resignFirstResponder()
        self.fruitStatsInput.resignFirstResponder()
        self.strField.resignFirstResponder()
        self.engField.resignFirstResponder()
        self.agiField.resignFirstResponder()
        self.staField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if !(self.rebirthInput.text?.isEmpty)! && !(self.levelInput.text?.isEmpty)! && self.validationForRebirth(self.rebirthInput.text) && validationForLevels(self.levelInput.text) && validationForCreatons(self.fruitStatsInput.text) {
            self.calculateButtonOutlet.isEnabled = true
        } else {
            self.calculateButtonOutlet.isEnabled = false
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
        
        if !((self.engField.text?.isEmpty)!) && self.engField.resignFirstResponder() && validationForCreatons(self.engField.text) {
            if Int(self.engField.text!)! > self.totalPoint {
                self.engField.text = String(self.totalPoint)
                self.updateStats(self.engField.text, stat: .eng)
            } else {
                self.updateStats(self.engField.text, stat: .eng)
            }
        } else if (self.engField.text?.isEmpty)! || self.engField.text == "0" {
            self.updateStats("0", stat: .eng)
        }
        
        if !((self.agiField.text?.isEmpty)!) && self.agiField.resignFirstResponder() && validationForCreatons(self.agiField.text){
            if Int(self.agiField.text!)! > self.totalPoint {
                self.agiField.text = String(self.totalPoint)
                self.updateStats(self.agiField.text, stat: .agi)
            } else {
                self.updateStats(self.agiField.text, stat: .agi)
            }
        } else if (self.agiField.text?.isEmpty)! || self.agiField.text == "0" {
            self.updateStats("0", stat: .agi)
        }
        
        if !((self.staField.text?.isEmpty)!) && self.staField.resignFirstResponder() && validationForCreatons(self.staField.text){
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
        self.engField.text = ""
        self.engField.resignFirstResponder()
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
        
        let format = "[0-9]{1,2}"
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
