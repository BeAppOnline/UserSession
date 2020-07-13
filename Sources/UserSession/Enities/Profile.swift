//
//  Profile.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation

public struct Profile {
    public let name: String
    public let email: String
    public let mobileNumber: String
    public let avatar: String
    public var products: [UserSubscription]
    
    public init(name: String, email: String, mobileNumber: String, avatar: String, products: [UserSubscription]) {
        self.name = name
        self.email = email
        self.mobileNumber = mobileNumber
        self.avatar = avatar
        self.products = products
    }
}
extension Profile: Equatable { }
