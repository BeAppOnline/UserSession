//
//  KeychainItemQuery.swift
//  
//
//  Created by Ali Fakih on 6/11/20.
//

import Foundation

class KeychainItemQuery: KeychainItem {
    // MARK: - Properties
    let matchLimit = kSecMatchLimit as String
    let returnData = kSecReturnData as String

    // MARK: - Methods
    override func asDictionary() -> CFDictionary {
      let query: [String: AnyObject] = [itemClass: kSecClassGenericPassword,
                                        itemService: service,
                                        matchLimit: kSecMatchLimitOne,
                                        returnData: kCFBooleanTrue]
      return query as CFDictionary
    }
}
