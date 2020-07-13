//
//  UserSubscriptions.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation

public struct UserSubscriptions {
    public var transactionDate: Date
    public var expireDate: Date
    public var transactionState: Int
    public var productIdentifier: String
    public var applicationUserName: String?
    public var status: Bool
    
    open func isPurchaseActive() -> Bool {
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

extension UserSubscriptions: Equatable {}
