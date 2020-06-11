//
//  UserSubscriptions.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation

public struct UserSubscriptions {
    var transactionDate: Date
    var expireDate: Date
    var transactionState: Int
    var productIdentifier: String
    var applicationUserName: String?
    var status: Bool
    
    func isPurchaseActive() -> Bool {
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
