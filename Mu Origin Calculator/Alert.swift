//
//  Alert.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 8/7/17.
//  Copyright © 2017 Oleksandr Kysil. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    // MARK: - Variables
    static let sharedInstance = Alert()
    
    private init () {}
    
    // MARK: - Methods
    func errorAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
