//
//  UserSession.swift
//
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation

public struct UserSession {
    
    public var profile: Profile
    public var deeplinkUser: DeeplinkUserSession
    
    
    public init(profile: Profile, deeplinkUserSession: DeeplinkUserSession) {
        self.profile = profile
        self.deeplinkUser = deeplinkUserSession
    }
    
    public func isProActive() -> Bool {
        var inAppPurchased: Bool = false
        for product in profile.products {
            if product.isPurchaseActive() {
                inAppPurchased = true
                break
            }
        }
        return inAppPurchased || deeplinkUser.isPurchased
    }
    
    
    public func logSession() {
        print("profile \(profile)")
        print("Profile.Name \(profile.name)")
        print("Profile.email \(profile.email)")
        print("Profile.mobileNumber \(profile.mobileNumber)")
        print("Profile.product count \(profile.products.count)")
        
        print("*********** DEEPLINK ***********")
        print("is Valid Deeplink User: \(self.deeplinkUser.isValidDeeplinkUser())")
        print("deeplink: \(String(describing: self.deeplinkUser.deeplink))")
        print("is Pro: \(self.deeplinkUser.isPurchased)")
        print("*********** END DEEPLINK ***********")
        
        for p in profile.products {
            print("product identifier \(p.productIdentifier)")
            print("product Transaction status \(p.transactionState)")
            print("product Transaction applicationUserName \(String(describing: p.applicationUserName))")
            print("product Transaction Purchase Date: \(String(describing: p.transactionDate))")
            print("product Transaction expire Date: \(String(describing: p.expireDate))")
            print("Current Date \(String(describing: Date()))")
        }
    }
}

extension UserSession: Equatable {
    public static func == (lhs: UserSession, rhs: UserSession) -> Bool {
        return lhs.profile == rhs.profile
    }
}

