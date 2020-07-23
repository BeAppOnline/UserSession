//
//  DeeplinkUserSession.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

public struct DeeplinkUserSession {
    var deeplink: String? = nil
    var isPurchased: Bool = false
    
    public init(deeplink: String? = nil, isPurchased: Bool = false) {
        self.deeplink = deeplink
        self.isPurchased = isPurchased
    }
    
    public func isValidDeeplinkUser() -> Bool {
        return self.deeplink != nil
    }
    
    public func getDeeplink() -> String? {
        return deeplink
    }
}
