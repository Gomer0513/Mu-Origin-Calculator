//
//  Protocols.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 2/20/19.
//  Copyright © 2019 Oleksandr Kysil. All rights reserved.
//

import Foundation

// MARK: - Protocol saveDataDelegate

protocol SaveDataDelegate {
  func saveData(_ isActive: Bool, clas: Classes)
}

// MARK: - Protocol MenuViewControllerDelegate

protocol MenuViewControllerDelegate {
  func segue(_ index: Classes)
}

// MARK: - Protocol IAPHelperDelegate

protocol IAPHelperDelegate {
  func sendInformation(message: String, success: Bool)
  func isPaymentSuccessful(_ success: Bool)
}
