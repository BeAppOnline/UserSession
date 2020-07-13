//
//  UserSubscriptions.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation

public struct UserSubscription {
    init(transactionDate: Date, expireDate: Date, transactionState: Int, productIdentifier: String, applicationUserName: String? = nil, status: Bool) {
        self.transactionDate = transactionDate
        self.expireDate = expireDate
        self.transactionState = transactionState
        self.productIdentifier = productIdentifier
        self.applicationUserName = applicationUserName
        self.status = status
    }
    
    public var transactionDate: Date
    public var expireDate: Date
    var transactionState: Int
    public var productIdentifier: String
    public var applicationUserName: String?
    var status: Bool
    
    public func isPurchaseActive() -> Bool {
        let userDef = UserDefaults.standard
        if userDef.bool(forKey: productIdentifier) {
            return isCurrentSubscriptionActive(exDate: expireDate)
        }
        return false
    }
    
    private func isCurrentSubscriptionActive(exDate:Date) -> Bool {
        let currentDateTime = Date()

        return (exDate.timeIntervalSince(currentDateTime) > 0)
    }
}

extension UserSubscription: Equatable {}
