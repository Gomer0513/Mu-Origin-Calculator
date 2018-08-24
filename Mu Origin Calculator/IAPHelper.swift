//
//  IAPHelper.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 8/24/18.
//  Copyright © 2018 Oleksandr Kysil. All rights reserved.
//

import Foundation
import StoreKit

class IAPHelper: NSObject {
    
    // MARK:- Constants
    static let singletonHelper = IAPHelper()
    
    // MARK:- Variables
    internal var product: SKProduct!
    var delegate: IAPHelperDelegate?
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
}

extension IAPHelper: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                UserDefaults.standard.set(true, forKey: "Purchase")
                delegate?.isPaymentSuccessful(true)
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .restored:
                SKPaymentQueue.default().restoreCompletedTransactions()
                UserDefaults.standard.set(true, forKey: "Purchase")
                delegate?.sendInformation(message: "Your Payment has been successfully restored!", success: true)
                break
            default: break
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        delegate?.sendInformation(message: error.localizedDescription, success: false)
        delegate?.isPaymentSuccessful(false)
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        delegate?.isPaymentSuccessful(true)
    }
}

extension IAPHelper: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count != 0 {
            for product in response.products {
                self.product = product
                self.purchaseMyProduct(product: self.product)
            }
        } else {
            print("there are no products!")
        }
        
        if response.invalidProductIdentifiers.count != 0 {
            print(response.invalidProductIdentifiers.description)
        }
    }
    
    func requestProductInfo() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifier = NSSet(object: productID)
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifier as! Set<String>)
    
            productRequest.delegate = self
            productRequest.start()
        }
    }
    
    func purchaseMyProduct(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        } else {
            delegate?.sendInformation(message: "Purchases are not supported by this device.", success: false)
        }
    }
    
    func restoreProducts() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

protocol IAPHelperDelegate {
    func sendInformation(message: String, success: Bool)
    func isPaymentSuccessful(_ success: Bool)
}
