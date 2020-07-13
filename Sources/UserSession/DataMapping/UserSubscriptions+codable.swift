//
//  UserSubscriptions+codable.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation

extension UserSubscription: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case expireDate
        case transactionDate
        case transactionState
        case productIdentifier
        case applicationUserName
        case status
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transactionDate = try container.decode(Date.self, forKey: .transactionDate)
        self.transactionState = try container.decode(Int.self, forKey: .transactionState)
        self.productIdentifier = try container.decode(String.self, forKey: .productIdentifier)
        self.applicationUserName = try container.decode(String.self, forKey: .applicationUserName)
        self.expireDate = try container.decode(Date.self, forKey: .expireDate)
        self.status = try container.decode(Bool.self, forKey: .status)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transactionDate, forKey: .transactionDate)
        try container.encode(transactionState, forKey: .transactionState)
        try container.encode(productIdentifier, forKey: .productIdentifier)
        try container.encode(applicationUserName, forKey: .applicationUserName)
        try container.encode(expireDate, forKey: .expireDate)
        try container.encode(status, forKey: .status)
    }
}
