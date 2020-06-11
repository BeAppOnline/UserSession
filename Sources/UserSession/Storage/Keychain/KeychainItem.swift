//
//  File.swift
//  
//
//  Created by Smart Mobile Tech on 6/11/20.
//

import Foundation

class KeychainItem {
    let service: NSString = "keychainWrapper.storage"
   let itemClass = kSecClass as String
    let itemService = kSecAttrService as String

    // MARK: - Methods
    func asDictionary() -> CFDictionary {
      let item: [String: AnyObject] = [itemClass: kSecClassGenericPassword,
                                       itemService: service]
      return item as CFDictionary
    }
}
